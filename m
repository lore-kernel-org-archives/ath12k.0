Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38289C7EE30
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 01:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss/pKba7pzgCNRJClxP21BAUhBoAciCIn0DX01b6hoo=; b=ki6Ja3a5dCgSyacRVI5Y1VMDiB
	XpLf/hAy+0rf89ab42bij9QQmRTFgHME+/MkKNmUh/h9+Ein3DSPLpF8RPrZIwW/htlRgWuTQ/Na8
	Arpl4/mFOSDgWcOyQK9Rb1e1NEWzTgYGK1kG0CNOjFBvUoFYDDJmikJVoezHEDknQXeqvi/uhzWi3
	4XI2vLsV1lCVIK08lfLGoFNfR8d7COnHRwXNM+5DAa1JvKoRjEkSto8KAVxTZohCclG3Qg1at+KvF
	2Xrpfvh9+tMtRyFzv+kFC9Li2ZVSrMe75LocJ4MthDhFgLckTUlHARd/W2I0b1Y+OsEAW5caA5V8a
	PThPVM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW3d8-00000000zYv-3xFb;
	Mon, 30 Jun 2025 01:48:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW3XC-00000000z2k-26hJ
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 01:42:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFLgDE029395
	for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 01:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ss/pKba7pzgCNRJClxP21BAUhBoAciCIn0DX01b6hoo=; b=kO6JZB8I8LTnJu+U
	rnnMKYhj34BSpLbejM5YQaGLRYFTCsPxlJ5lYK1LejDdYOLsDwXW4kn/ucBcLA7u
	kECM4Dr5yOKUNU+9UPLkJmmv0EmX+i6J/EqwysflX5rVaZiSWrQaMuVOWbzbYmsr
	j/m2z8PW6l7S/6zPc7DCGPx2CQt88y0ibiLlegwX0JTlOwvMRkJhHd5TCfT6hmkk
	/9giwGi0AX/RT15QNqA0I+1WlF7k2yNht0ByaUeuS+xuNrOhWAD0ezEHzvDG9PT+
	dyQruJt4wCM6981lzR43GAcmymn55IBgUTsatmaiizZBlcl61wpqUAL6Lg+9xk3q
	QivuVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcjx8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 01:42:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235dd77d11fso12087565ad.0
        for <ath12k@lists.infradead.org>; Sun, 29 Jun 2025 18:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751247731; x=1751852531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ss/pKba7pzgCNRJClxP21BAUhBoAciCIn0DX01b6hoo=;
        b=IgnqyOlLBslHwUeubADa0iVdLtZvXBR2lY1am9dQOiEO3NVbX5ZRM2C3KrNoe4MjBa
         AlblYlTfJL4QQ4pipDmz1MDMrZpHIGHR19RGeHNS9Uzu/9rUZplG3NBA4dGLQdJhprsL
         huaSMydamXrSFNR5fr89+VAFUjytyLl9IlnojvzhWx0JYF5ENPkuRpUMo2GDsMAnKx7w
         sRL4a+DVNfDBDEtRDsgAvA83oAKKlmkNz8bMLbTDxjEGIJZ4Y/wFPRmpckqt6AGp1vkz
         4qWN/IEDK3gkas1BLRGnGJifSJQvOCC01LXzVk+VqkVfjBs73ZMQ5VgTPHMpFHwi4Klh
         X7ig==
X-Forwarded-Encrypted: i=1; AJvYcCVfYwdfRG7b7shhNanNKpa0i7uw1IplsXk4TcxXPkAX6vOVdmZlAZAJH5JaXY1ZUyM77X6XRWg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwE/28XTzYKSt4bPx2B1jtSN1QwCThoPUifPDjP0cWiT93hTKHI
	Dh9epdH79jtlApsT0KJ2a15H7MeTWfkvPwMslKGXG2YqcW8R6pSlgQ1m0df+xSjS3Tmt/7RKniL
	tWw6nogtg8Mx402+XH92RgNSBDL70NMiz9qd70MAo4S2rP4t/7CnWXfqOegnsx12bK5YJlY9t
X-Gm-Gg: ASbGncuGqdGOz7TwEpZoUNAVFqCXzVypS4aNvhIIGc58tb15EbKrYaTtesSjJ9vVmyt
	lXnFzu+LUGsB2DWkWCzzRJF5t8qOd5YE5wJQ/P4R34WXvZM+SaU+Mf5A8rk2Iu1c+d1dO1s9/s+
	aT+cd373TLUXcmWCUYUUId7xqCTURTEVtTBt+NrPxA91ZR60nSP49nBkKQrqmexSx3TcCCZlp3O
	/O2IjbLEaptoJ0F2w+rtKWsoIlQ1B8zoRWZyukBcUidRcr1RyRqMS7X60HPBxZxVnXQCdR/heRj
	jpaPvAq+a87+/GYP20yDpQOY9d2ON7unHf4EnVg/2UMWhwIhDvED3oyaeAls/qnPwbbvKD1YH+p
	w5g==
X-Received: by 2002:a17:902:ef4f:b0:235:81c7:3c45 with SMTP id d9443c01a7336-23ac466434cmr164490875ad.46.1751247731445;
        Sun, 29 Jun 2025 18:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4YRd+INElqIYVt36NPdTlwHUeoHooYZwaiVfb7x7BH5AXZqsxYZeEMaK7tIHiAr1ylrzuvQ==
X-Received: by 2002:a17:902:ef4f:b0:235:81c7:3c45 with SMTP id d9443c01a7336-23ac466434cmr164490615ad.46.1751247730980;
        Sun, 29 Jun 2025 18:42:10 -0700 (PDT)
Received: from [10.110.62.176] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b900sm70621755ad.93.2025.06.29.18.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 18:42:10 -0700 (PDT)
Message-ID: <3bd353e1-56a7-4d91-9192-593b3f886eb5@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 09:42:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6GHz issue QCNCM865 (WCN7850) firmware
To: Janek <janekkw@proton.me>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <l262t2ImXM_3Szbm3CnRu6PnXIAgw32DZBoz-Oai5GGVy-GbMqeAQLGO8Uu1PU4do9tMF0kpAZ3GFk40Nnq2fPjj2hVwCDmEuao3Xfqq6nQ=@proton.me>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <l262t2ImXM_3Szbm3CnRu6PnXIAgw32DZBoz-Oai5GGVy-GbMqeAQLGO8Uu1PU4do9tMF0kpAZ3GFk40Nnq2fPjj2hVwCDmEuao3Xfqq6nQ=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nGmE12NGuv6alIlfV3PVVseDa7S1Gutr
X-Proofpoint-ORIG-GUID: nGmE12NGuv6alIlfV3PVVseDa7S1Gutr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDAxMiBTYWx0ZWRfX7uesSv0TaMmT
 R0BhwPt5z7+JEj1Jggz+BOy+tl2nHaqj51e41Q9cp2CjYwqs9n989MZjgCpFwDy+UB8oND4aYpP
 cxjERflpTLTitYLvPhbQ8bQ9ArG5+sqrhb/u1Kz+pQINNw5DyW5E9WKL45QCmwxec12b1f13o1Z
 k3bO+0PqNXEn1zjJ2H1GHGe2bhPjYKgjP/Hj4mSU/s+doUbEylHYHmEKA/nvv+Jga0X+PxgtujS
 0GIDKxYCIF/4iWv5L7i89y3jSAe/9opnCEM7MJy3cnyPdahOmjbL3x+Qhc79VtWbPQBy+4dqW8C
 1aNUgRbuFst/pS102YuilGcKa8Bln2tfuOYXkxgkq1AAvs0pjA6TyKsghNrmnQEDXm72TWS06DB
 7M1bw4EXdOF4J4gHDnE43pLq8VMLoVZjs9z+HAkW89XjN4N3GvIbSpSDt7k0CHleCMNBcMxv
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6861eb74 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=Afpsfah9AFh8VtEV8BwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_184214_561516_AD747E59 
X-CRM114-Status: GOOD (  18.58  )
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



On 6/28/2025 3:19 AM, Janek wrote:
> Hi,
> 
> Yesterday, I noticed that I could not "see" or connect to any 6GHz SSID/AP. After some checking, I noticed that my WiFi card was stuck with the reg country 00, as below:
> 
> $ iw reg get
> global
> country PL: DFS-ETSI
> 	(2400 - 2483 @ 40), (N/A, 20), (N/A)
> 	(5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
> 	(5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
> 	(5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
> 	(5725 - 5875 @ 80), (N/A, 13), (N/A)
> 	(5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
> 	(57000 - 66000 @ 2160), (N/A, 40), (N/A)
> 
> phy#0 (self-managed)
> country 00: DFS-UNSET
> 	(2402 - 2472 @ 40), (N/A, 20), (N/A)
> 	(2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
> 	(5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> 	(5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> 	(5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> 
> 
> I'm not sure what caused this, but I suspect that is the firmware that was updated on last Sunday, as part of the Fedora 42 package named atheros-firmware-20250613-1.fc42 (WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3).
> 
> I've tried reverting the kernel to 6.14.9 (that I was running before the 6.15.3), it did not help, after manually downloading and installing the previous known good firmware, I got it to connect to 6GHz networks (both ax and be).
> 
> Currently installed firmware: atheros-firmware-20250410-1.fc42 (WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3) 6GHz working.
> 
> My system details
> WiFi card: QCNCM865 (WCN7850)
> Distro: Fedora 42
> Kernel: 6.15.3 from Fedora

Recently a series fixing 6 GHz issue has been merged upstream

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath12k?id=d662c14a51910ba0ad66afd248b601ba30b9f7f1
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath12k?id=37e775a0a9d79a031d28d9e21480f99f448e9215
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath12k?id=886bb3624e4c9914a943b63fcfdf30b8d2f2b66e

Can you pick them and try again? Or even better to try the latest mainline kernel?


> Affected firmware: WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 (from Fedora package atheros-firmware-20250613-1.fc42)
> 
> related dmesg output:
> [    5.082826] ath12k_pci 0000:01:00.0: BAR 0 [mem 0x90600000-0x907fffff 64bit]: assigned
> [    5.082844] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> [    5.083105] ath12k_pci 0000:01:00.0: MSI vectors: 16
> [    5.083110] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
> [    5.733493] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
> [    5.733499] ath12k_pci 0000:01:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> [    5.733744] ath12k_pci 0000:01:00.0: failed to get ACPI BDF EXT: 0
> [    5.958726] ath12k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
> 
> Let me know if there is any other info that I could get from my machine.
> 
> Thanks in advance,
> Janek
> 


