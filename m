Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DE3EC01B6
	for <ath12k@archiver.kernel.org>; Mon, 23 Mar 2026 09:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yC6KqEhBD7nKz1VCwQt+1LTIKX5Jf9ppnuejyB5n6g=; b=tiUWuIFc++MwQXEUGZpAGeDw/O
	pY+wxekSTkZm0vZUQAmzepP0KZV9+TJJD4DFxZ4xMVhHL//938CUh9G9N4Ig9zcVNKpycqbkZkMR8
	SXYWL5EFQ6/RQ3FgvgVUEt4wT5muec5X1+D52bis03puggqrEg+eyATxusXxRk0bwloBVfQdKj7+K
	vPRnD+2xkQpiET4fIJbDTT9Zuww8ynVqBEEeN+t8SgsmSdyUA4iTDbu8uTgd7I0mx4g6glLlCbktC
	+qDgent8Iri0kbZfb9B57IiPEd4xkWVwidkMbpQmW2jYbRtd2e+YE2GAh54FeWXdetRx4CIFH6w7b
	U6Yzo+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bd9-0000000GNnp-2G0i;
	Mon, 23 Mar 2026 09:31:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bd6-0000000GNkW-2wY6
	for ath12k@lists.infradead.org;
	Mon, 23 Mar 2026 09:31:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72Ap82508391
	for <ath12k@lists.infradead.org>; Mon, 23 Mar 2026 09:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yC6KqEhBD7nKz1VCwQt+1LTIKX5Jf9ppnuejyB5n6g=; b=CPEb3h6pCL2Imnl4
	NXyCTuriP+qCmI2l0o7mc6YjAdrIvnsD+wSYowJQn6Amcdi4EV6BeiC3sgzFrD/+
	pMkNFwNPpUK+Qly/B5EQL92h8A/sNwkesmNnxSsL+X2mAsfoNZB2cANP816v0fZw
	w8MAVsDedYc7g4qShxNIL0HQ0GOIu4pgieMO1nZyQ7lTl4h7j5Jp0uQUsbDllZWM
	eePTATsM/J18mqM/FUVHawidxne+zfqlMIWg/moJPb6JtjzZqPadHjK+guRKntRp
	4/zUPnqgCQBkQxfU6B6oT2v/z+6M9nuT0ktru/vMEfFHz6AgOHTvifAJ8HwEvuN8
	HLqHvQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5mtfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Mar 2026 09:31:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so1831956a12.2
        for <ath12k@lists.infradead.org>; Mon, 23 Mar 2026 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774258270; x=1774863070; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/yC6KqEhBD7nKz1VCwQt+1LTIKX5Jf9ppnuejyB5n6g=;
        b=iy0MN8snARkaA1dH3TM35OqP2z/CQTQ0h3OnqZVHJ6r/1feFUgT7JuBgiAJnJ1sUJL
         TIwy/ZWqmoMz+oYmXOBDP3P1nNj+D0APwsqPgMQ+YsM0PZj3jRa5w1o7P9gFI27Gm86y
         aJFPyNsKTxO01mL4oGAKXa88BxeHwFCmZ/u26Cdy9VYxFJNcNwYcA8aqnriY3agC+F+F
         gdWc0A4ffMP+OnyYtJTH6yP0C/b2tQMWQOofuzWnDYqU3OD/aWgyQPoRRbz+ykin8K49
         nCwiSXiQy0RwmqdYcZ2e12Kb1s0u0mAj636hHyKIkM8UuWOAHl/qdZpQ9EsXxuiXFIlI
         9aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774258270; x=1774863070;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yC6KqEhBD7nKz1VCwQt+1LTIKX5Jf9ppnuejyB5n6g=;
        b=Fhz9i2KvOGrky7fJ+iZLyLANDbBJ9pnlg5aWgrrJb+jT9KbabjSG/BC58uho324Amz
         Ym8DkaQIAJo+MSU3DtnQE0bzvkM/jEdehBEXW1ni32kvj6HC1410JO+3iP9LSjm4bpuj
         iDty/8WglEpsQ8BNU5rTyY6ibIlCwxI9RmY9Ki4RkhVbAcV1xKbD4EH+lILLq3sw6dW5
         GThWpUBU9KTk1IKz5ElOINDHLYnlufMyUxe5GjLratdqEIWXI2UngG+Hc8KK953TIEl3
         HmbTfpr/XB5KdvDSK7EGv3onQUOpD8al5JuiK+UjWAag2BMzq7KYQt3cLMy4teBrT42g
         UTOQ==
X-Gm-Message-State: AOJu0Yyl/o5TxuOiuLXELynOc+OSOxCp/IYQ1yhHypkjpMs0MS9rSEUP
	WnNb2pPzR6LtH95p7TX/H/RITeyaPl/WTS2hUupp8lveh/VSDBas6o9aOvJtKsi8zxoe2FHSHBm
	rJNoqnIBaFep7jbOcom6oAk+7Dw0FSY3UhLt10aIo4fViTKG2Uc8MS6sin/oeFPrO
X-Gm-Gg: ATEYQzxlc6aeL3wbzpDk3i+hrf99kL2ArnmArSuKHEBnYJOQRJprXNt+Fl0z5PSbFtp
	l/DN+S5h83PaSqye2N+PsCqDUGCnxAgFNoLHtOq4bAHsZtKsWvgOxOc2FsJRcHSlKRadUg+cIvN
	QyoV6c1ZBbMPtYWrOjAdHZ8mIE7MgjTxG7tcPKCCVPp56coQdjz5g0mFAnULlWQ05mqd98yyyh+
	ImtuT0ImIjnzo3Kdr1OGjuQ477zfqrm7NeU1ou+k7Sukb8T72agkwasKTWIRMyrDyZPyAJDPUij
	7X5r9d095uP5ABag7upcE7/O0JPsNmFMZD6iXapyb02laSaqXSF1tohSm8f+9i/ul7iLjzrHd7F
	eNC8oW5iUhf7jbYg8Ew/Q+CtQ1uhfWnM3f5/RSRBfWZhDP7nTtVolThaOJKu6bObxV/RyavVfnY
	SYimG7Cc+GDDYjXB9fkIs=
X-Received: by 2002:a05:6a20:1589:b0:398:9403:49f4 with SMTP id adf61e73a8af0-39bcea4434amr9383743637.30.1774258270188;
        Mon, 23 Mar 2026 02:31:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:1589:b0:398:9403:49f4 with SMTP id adf61e73a8af0-39bcea4434amr9383707637.30.1774258269575;
        Mon, 23 Mar 2026 02:31:09 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a814548sm7195522a12.9.2026.03.23.02.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:31:09 -0700 (PDT)
Message-ID: <d0db7062-f428-410d-a704-395d67bd4554@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:31:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: desc_va endianness problem
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ab0Y9v6BkH4HDrFr@FUE-ALEWI-WINX>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ab0Y9v6BkH4HDrFr@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c1085f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=aGmKbgPmMnVJ_m3FO8YA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Bf4YLnb-sxlhKuIWF_nCrzeP5X_4Mjup
X-Proofpoint-ORIG-GUID: Bf4YLnb-sxlhKuIWF_nCrzeP5X_4Mjup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MiBTYWx0ZWRfX5UA+Uecz92sw
 5Q5H48AVn/y+MSB6Hi4jcyqDCvMZ+opfpOJPcOCA0mRco5DHdbteiuRP/OQMcTklFnlO5k+zu19
 S7BhBqR/MiRlNqgOWe6FmkdZFCqV06RnfKQrB4Ni99n0hgMRM4+Pq26scB/puXAfI1we86cmlmE
 W1w7dJeMs0X6gSWumAjj2wSVK4c62DGMU7d+UVjKRTVYJi5Dv5G1u4RTl7Jjs35b1sBR/FRLjD8
 D3dlJzasYPXh3gUapesAmUxLEGcq0jVfcBDGbU9dycwlDK1lO2kO40iXgDwyohPpnbovMaD3oHB
 /ZVbPWKfaBFR83YiEwHmOs4hxeZ7B/ToZFsmqwqGn8vzEtbF5iaVNdT0ds0DqiWjwyM/47Bcsl8
 8o8X48zmUzvnV7HyL3F2WwS84WdJP0qwlJmccvOu3Q9fSwWl8b2ZcCRg8t43KYe1yL1STnvUhbw
 P+z/IEFJtOYCHuH1+/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_023125_421275_6FBBFE1E 
X-CRM114-Status: GOOD (  24.81  )
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



On 3/20/2026 5:52 PM, Alexander Wilhelm wrote:
> Hello ath12k developers,
> 
> I have another fix for the big endian platform, but unfortunately the data types
> do not match here, so I need your support. The problem is the following: the
> structs `hal_reo_dest_ring`, `hal_wbm_completion_ring`, and
> `hal_wbm_release_ring_cc_rx` all define the members `buf_va_lo` and `buf_va_hi`
> as `__le32`. At first glance this seems correct, because the entire structure
> contains only little endian fields. The local variable `desc_va` in each
> function (see patch below) is of type `u64`, so it makes sense that I would need
> to convert from little endian to CPU endian. Unfortunately, this leads to the
> following crashes, in `tx_completion` and `rx_process_wbm`, respectivally:
> 
> 
>     Kernel attempted to read user page (40dcdf) - exploit attempt? (uid: 0)
>     BUG: Unable to handle kernel data access on read at 0x0040dcdf
>     Faulting instruction address: 0xe209290c
>     Oops: Kernel access of bad area, sig: 11 [#1]
>     BE PAGE_SIZE=4K SMP NR_CPUS=4 CoreNet Generic
>     Modules linked in: ath12k(O) mac80211(O) cfg80211(O) compat(O) ...
>     CPU: 1 PID: 10200 Comm: jshn Tainted: G           O       6.6.73 #0
>     Hardware name: CyBoxAP-A e5500 0x80241021 CoreNet Generic
>     NIP:  e209290c LR: e2092854 CTR: c08d3190
>     REGS: dffe3d40 TRAP: 0300   Tainted: G           O        (6.6.73)
>     MSR:  00029002 <CE,EE,ME>  CR: 44004804  XER: 00000000
>     DEAR: 0040dcdf ESR: 00000000 
>     GPR00: e2092854 dffe3e30 c328a500 e2092854 0040dcce 00000008 00070000 cf900000 
>     GPR08: 00000000 cf900004 40000000 c8e52c4c c08d3190 1002801c 0fcf5000 c0ab85f8 
>     GPR16: d0d1f7a0 c12a9080 00000001 df7b7f80 00000003 cf900000 e1bc0000 e1ccb988 
>     GPR24: ffffffff c8ed0000 e1cc0220 00000000 c8ec0000 c8ec0000 c8ec0f50 c8ec0000 
>     NIP [e209290c] ath12k_dp_tx_completion_handler+0x22c/0x720 [ath12k]
>     LR [e2092854] ath12k_dp_tx_completion_handler+0x174/0x720 [ath12k]
>     Call Trace:
>     [dffe3e30] [e2092854] ath12k_dp_tx_completion_handler+0x174/0x720 [ath12k] (unreliable)
>     [dffe3e80] [e208fe18] ath12k_dp_service_srng+0x58/0x380 [ath12k]
>     [dffe3ed0] [e20a1490] ath12k_pci_hif_resume+0x520/0x8a0 [ath12k]
>     [dffe3f00] [c067404c] __napi_poll+0x4c/0x260
>     [dffe3f30] [c06746f8] net_rx_action+0x188/0x340
>     [dffe3fa0] [c003a3d8] handle_softirqs+0x128/0x280
>     [dffe3ff0] [c00045b0] do_softirq_own_stack+0x30/0x50
>     [d0f2fb70] [00000000] 0x0
>     [d0f2fb90] [c003a7d0] irq_exit+0x70/0xa0
>     [d0f2fba0] [c0000c84] ExternalInput+0x144/0x160
>     --- interrupt: 500 at percpu_counter_add_batch+0x9c/0x150
>     NIP:  c0425e8c LR: c01a5964 CTR: c01764e0
>     REGS: d0f2fbb0 TRAP: 0500   Tainted: G           O        (6.6.73)
>     MSR:  00029002 <CE,EE,ME>  CR: 48008802  XER: 20000000
> 
>     GPR00: c01a5a00 d0f2fca0 c328a500 c1db7300 dffc0f20 00000000 fffffffc 00021002 
>     GPR08: 1e763000 e1091054 00000007 c12b0530 88002808 1002801c 0fcf5000 c0ab85f8 
>     GPR16: d0d1f7a0 dffc0f20 00000000 000003fe 00000000 f92412bd 00000003 c9525480 
>     GPR24: d0f2fd74 c8a501f8 c12b0530 00029002 00000007 00000000 0000000b c1db7300 
>     NIP [c0425e8c] percpu_counter_add_batch+0x9c/0x150
>     LR [c01a5964] unmap_page_range+0x484/0x820
>     --- interrupt: 500
>     [d0f2fca0] [00000001] 0x1 (unreliable)
>     [d0f2fcd0] [c01a5a00] unmap_page_range+0x520/0x820
>     [d0f2fd60] [c01a5d9c] unmap_vmas+0x9c/0xe0
>     [d0f2fda0] [c01afef4] exit_mmap+0xb4/0x2a0
>     [d0f2fe40] [c0031610] mmput+0x40/0x140
>     [d0f2fe60] [c0038df4] do_exit+0x2b4/0x990
>     [d0f2feb0] [c00396c4] do_group_exit+0x34/0xa0
>     [d0f2fed0] [c0039748] sys_exit_group+0x18/0x20
>     [d0f2fee0] [c000dbac] system_call_exception+0xac/0x1f0
>     [d0f2ff00] [c00110e8] ret_from_syscall+0x0/0x28
>     --- interrupt: c00 at 0xfded438
>     NIP:  0fded438 LR: 0ff23958 CTR: 0fd94930
>     REGS: d0f2ff10 TRAP: 0c00   Tainted: G           O        (6.6.73)
>     MSR:  0002f902 <CE,EE,PR,FP,ME>  CR: 28002402  XER: 20000000
> 
>     GPR00: 000000ea bff93390 b0316520 00000000 113e8af0 113e8af0 00000000 00000000 
>     GPR08: 00000000 00000000 00000000 ffffffff b02ccb04 1002801c 100a0000 bfbc4260 
>     GPR16: 114974b0 00000000 114a4de0 00000000 b02cc900 00000001 00000000 00000001 
>     GPR24: 0ff239a0 00000000 00000001 00000000 b030f52c fffff000 0ff23958 00000000 
>     NIP [0fded438] 0xfded438
>     LR [0ff23958] 0xff23958
>     --- interrupt: c00
>     Code: 512a421e 2e140000 512a463e 40f20008 555b9f3e 39350004 754a4000 7c804c2c 41c20224 7c87442c 2c040000 41c20230 <88a40011> 7fc3f378 83a40008 8a640010
>     ---[ end trace 0000000000000000 ]---
> 
>     Kernel panic - not syncing: Fatal exception
>     ---[ end Kernel panic - not syncing: Fatal exception ]---
> 
> 
>     user@root:~# Kernel attempted to read user page (c011de) - exploit attempt? (uid: 0)
>     BUG: Unable to handle kernel data access on read at 0x00c011de
>     Faulting instruction address: 0xe1e3dc44
>     Oops: Kernel access of bad area, sig: 11 [#1]
>     BE PAGE_SIZE=4K SMP NR_CPUS=4 CoreNet Generic
>     Modules linked in: ...
>     CPU: 1 PID: 0 Comm: swapper/1 Tainted: G           O       6.6.73 #0
>     Hardware name: CyBoxAP-A e5500 0x80241021 CoreNet Generic
>     NIP:  e1e3dc44 LR: e1e3dc30 CTR: c08d40e0
>     REGS: dffe3ce0 TRAP: 0300   Tainted: G           O        (6.6.73)
>     MSR:  00029002 <CE,EE,ME>  CR: 44004402  XER: 00000000
>     DEAR: 00c011de ESR: 00000000 
>     GPR00: e1e33154 dffe3dd0 c1870000 00000000 cebe0000 00000000 00000000 00c011ce 
>     GPR08: 00000001 00000000 00020000 c30a294c c08d40e0 00000000 00000001 00000000 
>     GPR16: e1ce2668 c9270000 c9269a18 c92664d0 e1ce26dc 00000000 babababa dffe3df4 
>     GPR24: 00000040 00000000 c9266480 dffe3dec dffe3e04 c9260000 00c011ce c9269a18 
>     NIP [e1e3dc44] ath12k_dp_rx_process_wbm_err+0x124/0x600 [ath12k]
>     LR [e1e3dc30] ath12k_dp_rx_process_wbm_err+0x110/0x600 [ath12k]
>     Call Trace:
>     [dffe3dd0] [c0ab8e30] 0xc0ab8e30 (unreliable)
>     [dffe3e80] [e1e33154] ath12k_dp_service_srng+0x314/0x380 [ath12k]
>     [dffe3ed0] [e1e44540] ath12k_pci_hif_resume+0x520/0x8a0 [ath12k]
>     [dffe3f00] [c0674c7c] __napi_poll+0x4c/0x260
>     [dffe3f30] [c0675328] net_rx_action+0x188/0x340
>     [dffe3fa0] [c003a3d8] handle_softirqs+0x128/0x280
>     [dffe3ff0] [c00045b0] do_softirq_own_stack+0x30/0x50
>     [c18c7e10] [c12b040c] 0xc12b040c
>     [c18c7e30] [c003a7d0] irq_exit+0x70/0xa0
>     [c18c7e40] [c0000c84] ExternalInput+0x144/0x160
>     --- interrupt: 500 at arch_cpu_idle+0x24/0x50
>     NIP:  c00071f4 LR: c00071f4 CTR: c000fe14
>     REGS: c18c7e50 TRAP: 0500   Tainted: G           O        (6.6.73)
>     MSR:  0002b002 <CE,EE,FP,ME>  CR: 84000402  XER: 00000000
> 
>     GPR00: c08cc978 c18c7f40 c1870000 00000005 00000001 40000000 c328becc c12b0530 
>     GPR08: c12b0530 c000fe14 0098ca91 00154674 24000402 00000000 00000001 00000000 
>     GPR16: 00000000 00000000 c00119a0 dffee5f0 00000001 00000000 ffffffff c1050254 
>     GPR24: c12c0000 c0011970 c0011940 c12d0000 00000004 c12b040c c12b0000 00000001 
>     NIP [c00071f4] arch_cpu_idle+0x24/0x50
>     LR [c00071f4] arch_cpu_idle+0x24/0x50
>     --- interrupt: 500
>     [c18c7f40] [c0a367e0] 0xc0a367e0 (unreliable)
>     [c18c7f50] [c08cc978] default_idle_call+0x38/0x58
>     [c18c7f60] [c007b3b0] do_idle+0xf0/0x130
>     [c18c7f80] [c007b580] cpu_startup_entry+0x30/0x40
>     [c18c7fa0] [c001325c] start_secondary+0x48c/0x930
>     [c18c7ff0] [c0002870] __secondary_start+0x90/0xdc
>     Code: 7fa3eb78 4bfcba59 7c641b79 41c20144 38a10044 7fa3eb78 4bfcdb85 7c651b79 40c2026c 83c10058 2c1e0000 41c202d0 <813e0010> 7c09b000 41c20010 7e84a378
>     ---[ end trace 0000000000000000 ]---
> 
>     Kernel panic - not syncing: Fatal exception
>     ---[ end Kernel panic - not syncing: Fatal exception ]---
> 
> 
> My fix, as shown in the patch below, is to remove the conversion. But then the
> member variables `buf_va_lo` and `buf_va_hi` must be `u32`, which is obviously
> wrong. Alternatively, `desc_va` must be `__le64`, but that is likely also
> incorrect, because the address is simply dereferenced, and this clearly requires
> CPU endianness. What I also do not fully understand is who actually fills these
> addresses and at which stage this happens. I hope you can help clarify this so
> that I can provide a correct patch for this issue afterward.
> 
> 

hmm, i am not sure here, but can you please try

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 1c82d927d27b..f142759a217b 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1246,7 +1246,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)

                        /* Update descriptor VA in SPT */
                        rx_desc_addr = ath12k_dp_cc_get_desc_addr_ptr(dp, ppt_idx, j);
-                       *rx_desc_addr = &rx_descs[j];
+                       *rx_desc_addr = (struct ath12k_rx_desc_info
*)cpu_to_le64(&rx_descs[j]);
                }
        }

@@ -1286,7 +1286,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
                                /* Update descriptor VA in SPT */
                                tx_desc_addr =
                                        ath12k_dp_cc_get_desc_addr_ptr(dp, ppt_idx, j);
-                               *tx_desc_addr = &tx_descs[j];
+                               *tx_desc_addr = (struct ath12k_tx_desc_info
*)cpu_to_le64(&tx_descs[j]);
                        }
                }
                spin_unlock_bh(&dp->tx_desc_lock[pool_id]);


