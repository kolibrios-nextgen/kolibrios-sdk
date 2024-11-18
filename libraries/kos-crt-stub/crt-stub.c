extern int main (void);

__attribute__((noreturn)) void _crt_start(void)
{
    main();
    __asm__("int $0x40" ::"a"(-1));
    __builtin_unreachable();
}

int atexit(void (*func)( void ))
{
    return 1;
}
