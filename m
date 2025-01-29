Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8070BC02190
	for <ath12k@archiver.kernel.org>; Wed, 29 Jan 2025 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3kzk2wcxNpV008Zgeu2RBioZzGk4CNeLmyuD48bJ9Q=; b=IW+DmNvIziJTtQSRq8l+NnSh6/
	UVP1e7A4rcWinDZn9h+xIPY9NgV3yN8C3x2cxD7TFDzmAQWgGUZhvwvsJGdfb+TeUif2cIwjOfg1U
	LVCwRt43vq7YUu5x9eVj1et/0sldr/6AN4WXPyoVCbjKb173Eax4JaxgdfAFVdqz+IGmqwDiiRCa+
	V9DTrgV76uAUv8C5/8thdWn3v3ljDtuJX4QW6/U6VJ2r0fQ4qbk0E2hFJVuzqP2JhmyYXhe7u9EFD
	rCmsekzJAINdktg+Lw7OoQ35f1W/pQTRG9sj5jCf5jxGVCldpOe91toOknqw67hbH/sfRaSsK3ld7
	Ftg3t63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdApQ-00000007NR4-18Rf
	for ath12k@archiver.kernel.org;
	Wed, 29 Jan 2025 16:22:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAnj-00000007N85-0ewH
	for ath12k@lists.infradead.org;
	Wed, 29 Jan 2025 16:20:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43634b570c1so50802975e9.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jan 2025 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738167625; x=1738772425; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3kzk2wcxNpV008Zgeu2RBioZzGk4CNeLmyuD48bJ9Q=;
        b=EFzkzeHviMVk/8vz3DkkmbOeV8d/jzscTgdtb3z73NIjk026gm6o2SV8GXBimJGKM2
         bA2i+mm08s1JNAm/cbB+5QC6VRv2Mcccf9WYjyvj8I3FZh5mrTWDgki70N63PwZpffde
         gMY8jcOAecKxuB67GwwHs4kBqmKSdB5wJIyh0iFnIpowgz3s5T9YFyB/Iapv66qWprDz
         6AwmxRRzcDYpsUcTp67995DvFyw3RYzuzNdByBdFUGsx2FA+0LvWzm6gxxGLwmSLLvaj
         bhl71qp5YsEcymLqdCZHkdBYDbzNCk7ul/fPYyRx9CyD6qeNSd+IbVL6DQLhBqDC+xoR
         PZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167625; x=1738772425;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B3kzk2wcxNpV008Zgeu2RBioZzGk4CNeLmyuD48bJ9Q=;
        b=t6bn3qXE4LhgJgzTZU3EXP13mqSZu1zI1JwqZukuLE2h6nkZSHTqLFWv+fwHB06zFm
         V55zuiGNdOTwg7PQjwZF4wP3fTazE6gi533Ea2gYRWMeve0e1EmZGy0dR0OgAoSnCaTK
         bZqpOsOuwr8HAfZTEdHz4oB2Nb+mvWgpaGXoTEmo3Ouz+P/FevPlwqTlZ4jMuiQFoctr
         wEzVY+bRQPbJpUyl9EQYFQzoH90K7F9ZetDDWWtaLX8673nK4VOyrS/iNJvaTcpiMBvS
         KC2Ae3Lz9vytf6KmYoHE0uPmKPQrCoeR58zcnJ9ha6DE0F3oiY4fjW57lFoRqpFxkCQe
         JeTg==
X-Forwarded-Encrypted: i=1; AJvYcCUvP7IPno91E+fBI8v67BZHJU9Vrlf6kHF2i+hFHfZYIbH+7E2AayjNC0iDO9LgzkQZWNSRdaM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXHuCVVNFmJOi/HVDEY8iqVCySn6YoZ1E9zpn2AR8ihRXIXKLh
	87z/lzkVwB0mlODalO/9UdpZRdcMQLDfnIFlw/Dp5aVmWVIty7wDrjIcbQ==
X-Gm-Gg: ASbGncuQ6YN0tu0e7Qyhc/JIf4wbdREyfdveZjLofLiteIkgNULO8UwXgzS9mcuX24g
	hhOzA38uz9l3WBGKOSE+C9o/H0mpblplaHDFYjSn6BsiOLEaEnBFV3u3uZSsxGI8d4fW/FX/4Va
	lX/EEkUmShDZHzybYig01R9YrIJnow2Mj0ofmXiZpPhGC4uK2sZFZv/+/wG0vYCOalBERUvYE46
	iDcoxozfg3f5xVX2QvVWFXpgvHPHsgxKcotS4qOR4u+0Q7PAKCaPe4Par5LSjG0Eui5hDCX4c//
	vaRJNKCAy3o4R1AiwFPCdR0dWWZCCXSMVMkqg4olYFD8aBL1pVlkmEQ1HBxHt56dXqNC
X-Google-Smtp-Source: AGHT+IFu42pARCrLj576dslnMwOTHcaZOvX3fGLS0KzGGJQhDUTuPg6gTJi2Kw3yaIHjSN5zwNFRMw==
X-Received: by 2002:a05:600c:1c8d:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-438dc3fc478mr32270765e9.24.1738167624545;
        Wed, 29 Jan 2025 08:20:24 -0800 (PST)
Received: from dominikat-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d7bfsm17613334f8f.35.2025.01.29.08.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:20:23 -0800 (PST)
Message-ID: <e005001b039f3f46e4a190882fc9ad0d40e03734.camel@gmail.com>
Subject: Re: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK
 board
From: Parth Panchoil <parth105105@gmail.com>
To: "quic_bqiang@quicinc.com" <quic_bqiang@quicinc.com>, 
	"ath12k@lists.infradead.org"
	 <ath12k@lists.infradead.org>
Date: Wed, 29 Jan 2025 17:20:23 +0100
In-Reply-To: <afe586a1acf458edcfe7cf76f4dcfa8b18ad716a.camel@gmail.com>
References: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
	 <a15a1557-e5fb-404c-9031-21efbaa7e679@quicinc.com>
	 <c710004338102c19e5c05fb03d3256ccbdabd5f7.camel@toradex.com>
	 <afe586a1acf458edcfe7cf76f4dcfa8b18ad716a.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_082027_205364_B07DF663 
X-CRM114-Status: GOOD (  22.83  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi,

I would like to share more details regarding this issue.

A similar bug was previously reported:
https://lore.kernel.org/all/CAFED-jma7ZB17Rcgx9H+eVZ=3DN6Pty4__gz3B+O2V34Xt=
cEzOGg@mail.gmail.com/

Continuing my debugging on the mainline ath12k driver, I have been
investigating a startup hang/crash on my system.
So far, I have identified potential issues with memory mappings, where
the driver attempts to read an offset like GCC_GCC_PCIE_HOT_RST
(0x1e38338), which is significantly farther than PCIE_PCIE_PARF_LTSSM
(0x1e081b0).

I have tried several approaches, including:
- Adjusting the MMIO window dynamically based on the offset instead of
using a fixed window.
- Increasing the MMIO window size beyond 512 KiB.
However, these changes did not resolve the issue.

I am sharing my debug logs below (The patch enabling these exact logs
is pasted), which may be useful for someone working on this driver to
identify the root cause and help resolve this bug.

Any insights or suggestions would be greatly appreciated.

root@am69-sk:~# uname -a
Linux am69-sk 6.13.0-rc7-wt-ath-ge7ef944b3e2c-dirty #4 SMP PREEMPT Wed
Jan 29 08:55:48 CET 2025 aarch64 GNU/Linux

root@am69-sk:~# insmod ./ath12k.ko debug_mask=3D0xffffffff
[   50.148099] ath12k_pci 0002:01:00.0: BAR 0 [mem 0x4410200000-
0x44103fffff 64bit]: assigned
[   50.156434] ath12k_pci 0002:01:00.0: enabling device (0000 -> 0002)
[   50.162775] ath12k_pci 0002:01:00.0: boot pci_mem 0x000000005f7b1667
[   50.169126] ath12k_pci 0002:01:00.0: pci probe 17cb:1107 17cb:1107
[   50.175294] ### DBG: ath12k_pci_read32 1199 offset =3D1b00000
[   50.180856] ### DBG: ath12k_pci_read32 1217 offset =3D 1b00000
[   50.186504] ### DBG: ath12k_pci_select_window 177 window =3D 36
ab_pci->register_window =3D 0 WINDOW_REG_ADDRESS =3D 310c
[   50.196920] ### DBG: ath12k_pci_select_window 178 (WINDOW_ENABLE_BIT
| window) =3D 40000036
[   50.205084] ### DBG: ath12k_pci_select_window 179 ab->mem +
WINDOW_REG_ADDRESS =3D 8aa0310c
[   50.213248] ### DBG: ath12k_pci_read32 1220 ab_pci->register_window
=3D 36=20
[   50.220023] ### DBG: ath12k_pci_read32 1221 window_start =3D 80000
offset =3D 1b00000 WINDOW_RANGE_MASK =3D 7ffff=20
[   50.229831] ### DBG: ath12k_pci_read32 1229 window_start =3D 80000
offset =3D 1b00000 WINDOW_RANGE_MASK =3D 7ffff ab->mem =3D 8aa00000
[   50.241200] ### DBG: ath12k_pci_read32 1230 ab->mem + window_start +
(offset & WINDOW_RANGE_MASK) =3D 8aa80000
[   50.251010] ### DBG: ath12k_pci_read32 1233
[   50.255185] ### DBG: ath12k_pci_read32 1243 val =3D 40170200
[   50.260658] ath12k_pci 0002:01:00.0: pci tcsr_soc_hw_version major 2
minor 0
[   50.268230] ath12k_pci 0002:01:00.0: MSI vectors: 16
[   50.273212] ath12k_pci 0002:01:00.0: msi base data is 0
[   50.278430] ath12k_pci 0002:01:00.0: Hardware name: wcn7850 hw2.0
[   50.290532] ath12k_pci 0002:01:00.0: failed to load firmware-2.bin:
-2
[   50.297063] ath12k_pci 0002:01:00.0: using fw api 1
[   50.301959] ath12k_pci 0002:01:00.0: Assign MSI to user: MHI,
num_vectors: 3, user_base_data: 0, base_vector: 0
[   50.312038] ath12k_pci 0002:01:00.0: Number of assigned MSI for MHI
is 3, base vector is 0
[   50.322527] ath12k_pci 0002:01:00.0: Assign MSI to user: CE,
num_vectors: 5, user_base_data: 3, base_vector: 3
[   50.332673] ath12k_pci 0002:01:00.0: Assign MSI to user: DP,
num_vectors: 8, user_base_data: 8, base_vector: 8
[   50.342697] ath12k_pci 0002:01:00.0: irq:604 group:0
[   50.347696] ath12k_pci 0002:01:00.0: irq:605 group:1
[   50.352694] ath12k_pci 0002:01:00.0: irq:606 group:2
[   50.357698] ath12k_pci 0002:01:00.0: irq:607 group:3
[   50.362696] ath12k_pci 0002:01:00.0: irq:608 group:4
[   50.367693] ath12k_pci 0002:01:00.0: irq:609 group:5
[   50.372689] ath12k_pci 0002:01:00.0: irq:610 group:6
[   50.377716] ath12k_pci 0002:01:00.0: pci after request_irq
msi_ep_base_data 0
[   50.384846] ath12k_pci 0002:01:00.0: unable to get wsi info from dt,
grouping single device
[   50.393196] ath12k_pci 0002:01:00.0: wsi group-id 255 num-devices 1
index 0
[   50.400148] ath12k_pci 0002:01:00.0: num devices 1 num probed 1
[   50.423637] NET: Registered PF_QIPCRTR protocol family
[   50.429598] ### DBG: ath12k_pci_enable_ltssm 290
[   50.434225] ### DBG: ath12k_pci_read32 1199 offset =3D1e081b0
[   50.439790] ### DBG: ath12k_pci_read32 1217 offset =3D 1e081b0
[   50.445437] ### DBG: ath12k_pci_select_window 177 window =3D 3c
ab_pci->register_window =3D 0 WINDOW_REG_ADDRESS =3D 310c
[   50.455852] ### DBG: ath12k_pci_select_window 178 (WINDOW_ENABLE_BIT
| window) =3D 4000003c
[   50.464014] ### DBG: ath12k_pci_select_window 179 ab->mem +
WINDOW_REG_ADDRESS =3D 8aa0310c
[   50.472178] ### DBG: ath12k_pci_read32 1220 ab_pci->register_window
=3D 3c=20
[   50.478952] ### DBG: ath12k_pci_read32 1221 window_start =3D 80000
offset =3D 1e081b0 WINDOW_RANGE_MASK =3D 7ffff=20
[   50.488759] ### DBG: ath12k_pci_read32 1229 window_start =3D 80000
offset =3D 1e081b0 WINDOW_RANGE_MASK =3D 7ffff ab->mem =3D 8aa00000
[   50.500126] ### DBG: ath12k_pci_read32 1230 ab->mem + window_start +
(offset & WINDOW_RANGE_MASK) =3D 8aa881b0
[   50.509936] ### DBG: ath12k_pci_read32 1233
[   50.514109] ### DBG: ath12k_pci_read32 1243 val =3D 111
[   50.519150] ### DBG: ath12k_pci_enable_ltssm 293 val=3D111
[   50.524452] ath12k_pci 0002:01:00.0: pci ltssm 0x111
[   50.529407] ### DBG: ath12k_pci_enable_ltssm 305
[   50.534014] ### DBG: ath12k_pci_read32 1199 offset =3D1e38338
[   50.539577] ### DBG: ath12k_pci_read32 1217 offset =3D 1e38338
[   50.545227] ### DBG: ath12k_pci_read32 1220 ab_pci->register_window
=3D 3c=20
[   50.552001] ### DBG: ath12k_pci_read32 1221 window_start =3D 80000
offset =3D 1e38338 WINDOW_RANGE_MASK =3D 7ffff=20
[   50.561808] ### DBG: ath12k_pci_read32 1229 window_start =3D 80000
offset =3D 1e38338 WINDOW_RANGE_MASK =3D 7ffff ab->mem =3D 8aa00000
[   50.573175] ### DBG: ath12k_pci_read32 1230 ab->mem + window_start +
(offset & WINDOW_RANGE_MASK) =3D 8aab8338

Thank you.

Regards,
Parth P

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/drivers/net/wireless/ath/ath12k/pci.c
b/drivers/net/wireless/ath/ath12k/pci.c
index 06cff3849ab8..2984064783f9 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -174,6 +174,9 @@ static void ath12k_pci_select_window(struct
ath12k_pci *ab_pci, u32 offset)
 	window |=3D static_window;
=20
 	if (window !=3D ab_pci->register_window) {
+		printk("### DBG: %s %d window =3D %x ab_pci-
>register_window =3D %x WINDOW_REG_ADDRESS =3D
%x\n",__func__,__LINE__,window, ab_pci->register_window,
WINDOW_REG_ADDRESS);
+		printk("### DBG: %s %d (WINDOW_ENABLE_BIT | window) =3D
%x\n",__func__,__LINE__,(WINDOW_ENABLE_BIT | window) );
+		printk("### DBG: %s %d ab->mem + WINDOW_REG_ADDRESS =3D
%x\n",__func__,__LINE__,(ab->mem + WINDOW_REG_ADDRESS) );
 		iowrite32(WINDOW_ENABLE_BIT | window,
 			  ab->mem + WINDOW_REG_ADDRESS);
 		ioread32(ab->mem + WINDOW_REG_ADDRESS);
@@ -279,8 +282,15 @@ static void ath12k_pci_enable_ltssm(struct
ath12k_base *ab)
 	u32 val;
 	int i;
=20
+#if 0
+	/* Prevent startup crash on BPI-Rx */
+	return;
+#endif
+
+	printk("### DBG: %s %d\n",__func__,__LINE__);
 	val =3D ath12k_pci_read32(ab, PCIE_PCIE_PARF_LTSSM);
=20
+	printk("### DBG: %s %d val=3D%x\n",__func__,__LINE__,val);
 	/* PCIE link seems very unstable after the Hot Reset*/
 	for (i =3D 0; val !=3D PARM_LTSSM_VALUE && i < 5; i++) {
 		if (val =3D=3D 0xffffffff)
@@ -292,11 +302,15 @@ static void ath12k_pci_enable_ltssm(struct
ath12k_base *ab)
=20
 	ath12k_dbg(ab, ATH12K_DBG_PCI, "pci ltssm 0x%x\n", val);
=20
+	printk("### DBG: %s %d\n",__func__,__LINE__);
 	val =3D ath12k_pci_read32(ab, GCC_GCC_PCIE_HOT_RST);
+	printk("### DBG: %s %d val =3D %x\n",__func__,__LINE__,val);
 	val |=3D GCC_GCC_PCIE_HOT_RST_VAL;
+	printk("### DBG: %s %d val =3D %x\n",__func__,__LINE__,val);
 	ath12k_pci_write32(ab, GCC_GCC_PCIE_HOT_RST, val);
 	val =3D ath12k_pci_read32(ab, GCC_GCC_PCIE_HOT_RST);
=20
+	printk("### DBG: %s %d\n",__func__,__LINE__);
 	ath12k_dbg(ab, ATH12K_DBG_PCI, "pci pcie_hot_rst 0x%x\n",
val);
=20
 	mdelay(5);
@@ -1182,6 +1196,7 @@ u32 ath12k_pci_read32(struct ath12k_base *ab, u32
offset)
 	u32 val, window_start;
 	int ret =3D 0;
=20
+	printk("### DBG: %s %d offset
=3D%x\n",__func__,__LINE__,offset);
 	/* for offset beyond BAR + 4K - 32, may
 	 * need to wakeup MHI to access.
 	 */
@@ -1196,26 +1211,36 @@ u32 ath12k_pci_read32(struct ath12k_base *ab,
u32 offset)
 			window_start =3D ath12k_pci_get_window_start(ab,
offset);
 		else
 			window_start =3D WINDOW_START;
+			//window_start =3D (offset &
~WINDOW_RANGE_MASK);
=20
 		if (window_start =3D=3D WINDOW_START) {
+			printk("### DBG: %s %d offset =3D
%x\n",__func__,__LINE__,offset);
 			spin_lock_bh(&ab_pci->window_lock);
 			ath12k_pci_select_window(ab_pci, offset);
+			printk("### DBG: %s %d ab_pci->register_window
=3D %x \n",__func__,__LINE__, ab_pci->register_window);
+			printk("### DBG: %s %d window_start =3D %x
offset =3D %x WINDOW_RANGE_MASK =3D %x \n",__func__,__LINE__,
window_start,offset, WINDOW_RANGE_MASK);
=20
 			if
(ath12k_pci_is_offset_within_mhi_region(offset)) {
+				printk("### DBG: %s
%d\n",__func__,__LINE__);
 				offset =3D offset - PCI_MHIREGLEN_REG;
 				val =3D ioread32(ab->mem +
 					       (offset &
WINDOW_RANGE_MASK));
 			} else {
+				printk("### DBG: %s %d window_start =3D
%x offset =3D %x WINDOW_RANGE_MASK =3D %x ab->mem =3D
%x\n",__func__,__LINE__,window_start,offset, WINDOW_RANGE_MASK,ab-
>mem);
+				printk("### DBG: %s %d ab->mem +
window_start + (offset & WINDOW_RANGE_MASK) =3D
%x\n",__func__,__LINE__,ab->mem + window_start + (offset &
WINDOW_RANGE_MASK));
 				val =3D ioread32(ab->mem + window_start
+
 					       (offset &
WINDOW_RANGE_MASK));
+				printk("### DBG: %s
%d\n",__func__,__LINE__);
 			}
 			spin_unlock_bh(&ab_pci->window_lock);
 		} else {
+			printk("### DBG: %s %d\n",__func__,__LINE__);
 			val =3D ioread32(ab->mem + window_start +
 				       (offset & WINDOW_RANGE_MASK));
 		}
 	}
=20
+	printk("### DBG: %s %d val =3D %x\n",__func__,__LINE__,val);
 	if (test_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
 	    offset >=3D ACCESS_ALWAYS_OFF && ab_pci->pci_ops->release &&
 	    !ret)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

On Mon, 2025-01-27 at 15:01 +0100, Parth Panchoil wrote:
> Hi,
>=20
> I am currently debugging the ath12k_pci_enable_ltssm start up
> crash/bug
> with the mainline kernel on my system and would like to share my
> observations so far:
>=20
> The ath12k mainline driver gets stuck at this specific line:=20
> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef551=
9d366a/drivers/net/wireless/ath/ath12k/pci.c#L295
> in the ath12k_pci_enable_ltssm=C2=A0 which attempts to read
> GCC_GCC_PCIE_HOT_RST, particularly
> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef551=
9d366a/drivers/net/wireless/ath/ath12k/pci.c#L1209
>=20
> Interestingly, within the same function, the line val =3D
> ath12k_pci_read32(ab, PCIE_PCIE_PARF_LTSSM) successfully reads the
> expected value 0x111 for PCIE_PCIE_PARF_LTSSM.
>=20
> I am continuing to debug from my end, although my understanding of
> the
> ath12k driver is limited. Any leads, suggestions, or hints to help
> resolve this issue would be greatly appreciated.
>=20
> Thank you.
>=20
> Regards,
> Parth P
>=20
>=20
> On Fri, 2025-01-24 at 10:02 +0000, Parth Pancholi wrote:
> > I appreciate your response, Baochen.
> >=20
> > I have been working on enabling mainline kernel support on my TI
> > AM69-
> > SK board to test the mainline ath12k driver on my system.
> >=20
> > Using the mainline kernel repository for the ath drivers [1], I
> > made
> > the following observation:=C2=A0
> > While the exact crash observed earlier is no longer present, the
> > system
> > hangs upon loading the ath12k mainline driver, displaying the
> > messages
> > below.
> >=20
> > root@am69-sk:~# modprobe ath12k debug_mask=3D0xffffffff
> > [ 1121.996554] ath12k_pci 0000:01:00.0: BAR 0 [mem 0x4410200000-
> > 0x44103fffff 64bit]: assigned
> > [ 1122.004884] ath12k_pci 0000:01:00.0: enabling device (0000 ->
> > 0002)
> > [ 1122.011818] ath12k_pci 0000:01:00.0: MSI vectors: 16
> > [ 1122.016798] ath12k_pci 0000:01:00.0: Hardware name: wcn7850
> > hw2.0
> > [ 1122.040183] NET: Registered PF_QIPCRTR protocol family
> >=20
> > root@am69-sk:~# uname -a
> > Linux am69-sk 6.13.0-rc7-wt-ath-ge7ef944b3e2c-dirty #2 SMP PREEMPT
> > Wed
> > Jan 22 16:55:17 CET 2025 aarch64 GNU/Linux
> >=20
> > root@am69-sk:~# lspci
> > 0000:00:00.0 PCI bridge: Texas Instruments Device b012
> > 0000:01:00.0 Network controller: Qualcomm Technologies, Inc WCN785x
> > Wi-
> > Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
> > 0001:00:00.0 PCI bridge: Texas Instruments Device b012
> > 0002:00:00.0 PCI bridge: Texas Instruments Device b012
> >=20
> > Do you have any insights into what might still be missing or
> > incorrect
> > in my setup?
> >=20
> > Regards,
> > Parth P
> >=20
> > On Wed, 2025-01-22 at 15:20 +0800, Baochen Qiang wrote:
> > >=20
> > >=20
> > > On 1/21/2025 10:19 PM, Parth Panchoil wrote:
> > > > Hi All,
> > > >=20
> > > > I am performing tests on the SX-PCEBE Wi-Fi module, which
> > > > utilizes
> > > > the
> > > > ATH12k driver, on the Texas Instruments AM69-SK board.
> > > > The board is running the TI Linux Kernel from the ti-linux-
> > > > 6.6.y
> > >=20
> > > 6.6 is too old, and besides we don;t support customer kernel.
> > >=20
> > > Could you try latest ath tree [1] or the mainline tree [2]?
> > >=20
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
> > > [2]
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> > >=20
> > > If the issue is still seen, please enable verbose ath12k log
> > > using
> > > below command and help
> > > collect dmesg logs:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sudo modprobe ath12k =
debug_mask=3D0xffffffff
> > >=20
> > > One more thing, the open-WRT patch is overkill, can you narrow
> > > down
> > > to find which line of
> > > code in ath12k_pci_enable_ltssm() is causing this issue?
> > >=20
> > >=20
> > > > branch. During testing, I observed a kernel crash from the
> > > > ATH12k
> > > > driver as soon as the probe is called. The crash log is as
> > > > follows:
> > > >=20
> > > > [=C2=A0=C2=A0=C2=A0 9.492631] Kernel panic - not syncing: Asynchron=
ous SError
> > > > Interrupt
> > > > [=C2=A0=C2=A0=C2=A0 9.492634] CPU: 7 PID: 222 Comm: (udev-worker) N=
ot tainted
> > > > 6.6.58-
> > > > 01497-ga7758da17c28-dirty #1
> > > > [=C2=A0=C2=A0=C2=A0 9.492638] Hardware name: Texas Instruments AM69=
 SK (DT)
> > > > [=C2=A0=C2=A0=C2=A0 9.492640] Call trace:
> > > > [=C2=A0=C2=A0=C2=A0 9.492642]=C2=A0 dump_backtrace+0x94/0xec
> > > > [=C2=A0=C2=A0=C2=A0 9.492658]=C2=A0 show_stack+0x18/0x24
> > > > [=C2=A0=C2=A0=C2=A0 9.492662]=C2=A0 dump_stack_lvl+0x48/0x60
> > > > [=C2=A0=C2=A0=C2=A0 9.492669]=C2=A0 dump_stack+0x18/0x24
> > > > [=C2=A0=C2=A0=C2=A0 9.492672]=C2=A0 panic+0x320/0x378
> > > > [=C2=A0=C2=A0=C2=A0 9.492677]=C2=A0 nmi_panic+0x8c/0x90
> > > > [=C2=A0=C2=A0=C2=A0 9.492681]=C2=A0 arm64_serror_panic+0x6c/0x78
> > > > [=C2=A0=C2=A0=C2=A0 9.492686]=C2=A0 do_serror+0x3c/0x78
> > > > [=C2=A0=C2=A0=C2=A0 9.492692]=C2=A0 el1h_64_error_handler+0x34/0x4c
> > > > [=C2=A0=C2=A0=C2=A0 9.492697]=C2=A0 el1h_64_error+0x64/0x68
> > > > [=C2=A0=C2=A0=C2=A0 9.492700]=C2=A0 ath12k_pci_read32+0x1bc/0x1e8 [=
ath12k]
> > > > [=C2=A0=C2=A0=C2=A0 9.492725]=C2=A0 ath12k_pci_power_up+0xdc/0x340 =
[ath12k]
> > > > [=C2=A0=C2=A0=C2=A0 9.492747]=C2=A0 ath12k_core_init+0x2c/0xa8 [ath=
12k]
> > > > [=C2=A0=C2=A0=C2=A0 9.492769]=C2=A0 ath12k_pci_probe+0x698/0x908 [a=
th12k]
> > > > [=C2=A0=C2=A0=C2=A0 9.492791]=C2=A0 pci_device_probe+0xa8/0x16c
> > > > [=C2=A0=C2=A0=C2=A0 9.492800]=C2=A0 really_probe+0x110/0x27c
> > > > [=C2=A0=C2=A0=C2=A0 9.492805]=C2=A0 __driver_probe_device+0x78/0x12=
c
> > > > [=C2=A0=C2=A0=C2=A0 9.492808]=C2=A0 driver_probe_device+0x3c/0x118
> > > > [=C2=A0=C2=A0=C2=A0 9.492810]=C2=A0 __driver_attach+0x74/0x124
> > > > [=C2=A0=C2=A0=C2=A0 9.492813]=C2=A0 bus_for_each_dev+0x78/0xd8
> > > > [=C2=A0=C2=A0=C2=A0 9.492819]=C2=A0 driver_attach+0x24/0x30
> > > > [=C2=A0=C2=A0=C2=A0 9.492824]=C2=A0 bus_add_driver+0xe4/0x208
> > > > [=C2=A0=C2=A0=C2=A0 9.492828]=C2=A0 driver_register+0x60/0x128
> > > > [=C2=A0=C2=A0=C2=A0 9.492831]=C2=A0 __pci_register_driver+0x44/0x50
> > > > [=C2=A0=C2=A0=C2=A0 9.492835]=C2=A0 ath12k_pci_init+0x2c/0x6c [ath1=
2k]
> > > > [=C2=A0=C2=A0=C2=A0 9.492858]=C2=A0 do_one_initcall+0x70/0x1b4
> > > > [=C2=A0=C2=A0=C2=A0 9.492861]=C2=A0 do_init_module+0x58/0x1e4
> > > > [=C2=A0=C2=A0=C2=A0 9.492867]=C2=A0 load_module+0x19bc/0x1a8c
> > > > [=C2=A0=C2=A0=C2=A0 9.492869]=C2=A0 init_module_from_file+0x88/0xc4
> > > > [=C2=A0=C2=A0=C2=A0 9.492873]=C2=A0 __arm64_sys_finit_module+0x1c0/=
0x2ac
> > > > [=C2=A0=C2=A0=C2=A0 9.492877]=C2=A0 invoke_syscall+0x44/0x108
> > > > [=C2=A0=C2=A0=C2=A0 9.492882]=C2=A0 el0_svc_common.constprop.0+0xc0=
/0xe0
> > > > [=C2=A0=C2=A0=C2=A0 9.492885]=C2=A0 do_el0_svc+0x1c/0x28
> > > > [=C2=A0=C2=A0=C2=A0 9.492889]=C2=A0 el0_svc+0x2c/0x84
> > > > [=C2=A0=C2=A0=C2=A0 9.492892]=C2=A0 el0t_64_sync_handler+0xc0/0xc4
> > > > [=C2=A0=C2=A0=C2=A0 9.492895]=C2=A0 el0t_64_sync+0x190/0x194
> > > > [=C2=A0=C2=A0=C2=A0 9.492899] SMP: stopping secondary CPUs
> > > > [=C2=A0=C2=A0=C2=A0 9.492908] Kernel Offset: disabled
> > > > [=C2=A0=C2=A0=C2=A0 9.492909] CPU features: 0x0,80000200,28020000,1=
000420b
> > > > [=C2=A0=C2=A0=C2=A0 9.492913] Memory Limit: none
> > > >=20
> > > > Upon searching online, I found the OpenWRT patch that appears
> > > > to
> > > > address a similar issue: OpenWRT Patch: Prevent LTSSM Startup
> > > > Crash.
> > > > https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dpacka=
ge/kernel/mac80211/patches/ath12k/100-ath12k-prevent-ltssm-startup-crash.pa=
tch;h=3Dcd85a0f6aa2652d62bfbea04e9bcca3bcf831b7f;hb=3D935b2b7dcef61b2893ed5=
dff307dd8f8a1156899
> > > > With the above patch applied, I do not see the crash anymore.
> > > >=20
> > > > Could anyone confirm if this issue has been reported
> > > > before/known
> > > > bug
> > > > or provide any insights?=20
> > > > Any additional information or suggestions would be greatly
> > > > appreciated.
> > > >=20
> > > > Details about the test setup,
> > > > TI-AM69-SK board:
> > > > https://www.ti.com/tool/SK-AM69?keyMatch=3Dam69%20sk&tisearch=3Duni=
versal_search
> > > > Silex WiFi card SX-PCEBE:
> > > > https://www.silextechnology.com/connectivity-solutions/embedded-wir=
eless/sx-pcebe
> > > > TI Linux Repo:
> > > > https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=3Dti-lin=
ux-6.6.y
> > > >=20
> > > > Thank you.
> > > >=20
> > > > Regards,
> > > > Parth P
> > > >=20
> > >=20
> > >=20
> >=20
> >=20
>=20


