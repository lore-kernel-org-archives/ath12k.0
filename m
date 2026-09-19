Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA25C982D7
	for <ath12k@archiver.kernel.org>; Sat, 19 Sep 2026 14:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gjyz9E6/QmQLRCdy/3pVAAkYuVkZTNhqOb8DDaTX18=; b=p2NKcCnh8R5AsfYEQEnenvLpwy
	hFozeCW7liDTLpb71/wvLs27cYsexWaW1DmEO6nKfLMyDHDS8tpNKANdYDK4XLboOnzHETCc2Ophk
	LTB0TeAzf04I7PPhaISTSI2CYH3WE6P/Auwr/2FdknhVw1nVzqAUfF3L1NV0+1Lh2Xpw74fRbLF7e
	tFhkWEB3sktFb2LvOd81pQegBe7j0tLQwQNmrBM9zcrljgTEmh4JZK3FcaVMaC2GmQRdrxutfhtoH
	T533lZZbDg+oUi4VxSaKTgFFDT31F8kh7/95+5HB/1QiP9+AfdcEpPRNf3jN7KpZAm07kQ9DFuen9
	4aqGOr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vwb-0000000GMf4-1ISd;
	Sat, 19 Sep 2026 14:21:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vwY-0000000GMej-3HRc
	for ath12k@lists.infradead.org;
	Sat, 19 Sep 2026 14:21:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JDLGTS3066331
	for <ath12k@lists.infradead.org>; Sat, 19 Sep 2026 14:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gjyz9E6/QmQLRCdy/3pVAAkYuVkZTNhqOb8DDaTX18=; b=Q0R9EKSGLegCyeYl
	BeG4PkHqxQrzu/Je1cWIe5Z/5bDxB2icKexCIasUL+meTiq9eyl6o8t2p+sZndsU
	dBhJo4u0dMXBCJo6uU01boXWq5V3qxa0+aI78ZL6sgtkv6vdl/ToJ1sU4uEq9RN6
	LbEGK3VPvMJQ1WGzi0F2MrIiucwghlkGSrwC52G80dv7n0o7YqCzjX8fZW+u/++c
	QfQbxi3IhafYqKUevNJSIJMxSRUFlI9hhN3wicvDs8289w0kWVkqnOeHryG/JhU3
	VF4vtNP5nRevvAGABu7glerWdWdiUk6eY/s6emUoh6htP8WOeUb+lJpJZoahFKJ5
	nQ1XJg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9rw1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 19 Sep 2026 14:21:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so2418289a91.3
        for <ath12k@lists.infradead.org>; Sat, 19 Sep 2026 07:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789827689; x=1790432489; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0gjyz9E6/QmQLRCdy/3pVAAkYuVkZTNhqOb8DDaTX18=;
        b=NVbnIhDetSKM9IOui42okMU89q3ROD7RuHWMXcyihNL5Vw7cxg0bSdOVXY9ut64goF
         Gb47wFyUg5PdxkiAJlMDmgQ7ABguvNiZfNB14HomgZrg/dgZPzAoF45h0OkGZnH5mfBz
         r8mWSIp/KsrLgRcm161n5TsM5OFC4s2K3gx5OvITdXSrT9yj65f7u0PfZDOam33WLAfe
         8r3etQ46o/UmdwVb0AczbQHfOxAW29f6AtxP/lPSDTkYPg/6m/OAP4Kal8dvB7uIFdY9
         U4FHERRq+YfAxkQVplX2SYkQthZPPuZtnrxMl6ztSChmiQtrbJbXogq8kLn3bMOnALYU
         EdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827689; x=1790432489;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gjyz9E6/QmQLRCdy/3pVAAkYuVkZTNhqOb8DDaTX18=;
        b=iCNSjMhYRvj4O0KtsUNjepOx9CRUZlmJXs/Ob0HC4l5T683wNS+DmYiXyokl6vrDsK
         CizvUnDBeJxGswkR+3Xrj+72sEwdhsuKyEP9oS0+CQWs/oil6czMjS29lTF/0GrigNMg
         wvGh+RX2FbyJjatIkPA4emUKOE6aRfDGFG62/V0doJyzt6gnY3RQeDkbXPv+GG8HkX2u
         tfH/dTsQanBSvKA0abXHyNuK0tPRNu0ueuD1gmHtoNgcAFIl9Q3FhwnVxEUYuLRRKQOn
         O8rR45o58EgFCjpBFbtqRisU0hGYATWRXeshVfMpTyuSbaEC2N70La9R/IhPnZl/y+Fj
         luUg==
X-Forwarded-Encrypted: i=1; AKwUvBxGOgxS0ICRH4jcEovtcjzDV9M1u0OXd4Kln7RuyFiY7tBOG5CJg9VoLtR3VQsvaVEoXcHVag0=@lists.infradead.org
X-Gm-Message-State: AFuF++m8FkYxH7h/JaCsiSigszzhC3DerwjZ4vyU3ri0UhPIfRbyjVzb
	ac/+qH9AoiQiT17YB140ewMnZftVr2lrrhYAByn3emUlekU5xE8lf5jG1h/hbc6iz8YwhiWqty7
	zliOE+SaEYfde7xlfeIsMhQxTk4g8Au2Kcc62XfhUTwFPwCmPuim62jQ9bT9cgHsL
X-Gm-Gg: AYBFou2FOlCPVFW3PzAypNziecGf/S0QxGElter0xQVtFtPS6UMBk8Nclm9Ho0vrX5c
	hX0tf68uDuqOzQxPBo8keXlN50hjqcTHK4raLWmV8ZESok0X+HvYqjDF1oJyyDJkYWk2ahPTb+i
	rew6srCM7lAg5lO0kQNNaGXw0mz+P8Zk/9iMDWIfid9QZg0v7iR6CcYkkGVqm0PE3sLFU0Yq0zh
	1yzJyu2hDwByR77IA+TF1mJ1WBVTOhsvyIy9qQpEXyryC5S33i5wS0CvDOXjG5jzpBXOAkr1Spd
	vbDLSvHtKakJgoGOmOVeDIA51bWIL/mJ6UhuPTylgAOsSdMIPu6VfAbMNCyJgvmJ1IDWJEUmhkv
	2XlwA9/H1EJ8DV0sYigaQptsN3OQoesNBeefQFboaK51Mkt4sKGWZKSgTUQ==
X-Received: by 2002:a17:90b:2f03:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e54e3d374mr11379038a91.17.1789827688495;
        Sat, 19 Sep 2026 07:21:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2f03:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e54e3d374mr11378999a91.17.1789827687974;
        Sat, 19 Sep 2026 07:21:27 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54b248esm944821c88.1.2026.09.19.07.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:21:27 -0700 (PDT)
Message-ID: <0c08df2f-21db-4cda-9d38-491b98d8f207@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 07:21:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850 on Surface Pro 11: no board-2.bin entry, firmware reports
 no board ID
To: Dale Whinham <daleyo@gmail.com>, ath12k@lists.infradead.org
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org
References: <CAFcmK8h2nv5VPFErt-E93G6cKb-Ju33hfc=pSrTABK7nu_4kRg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFcmK8h2nv5VPFErt-E93G6cKb-Ju33hfc=pSrTABK7nu_4kRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SG5jLsfwE7MWSsof0swV7InMFszzU_iv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDIwOCBTYWx0ZWRfX6AeccB7WwPWW
 2N0owI1S67DVNKgv+Pg3+12oM5/fSv2wuzOVJkIo3vlvOx5e1DJumGriqsCxuMzw0OsH8ErC9Qg
 Pu7tbfvM5ya9pU+YnQf7N7qlmcmlnHsb+OxBdy5S4V4FR3g63vExfOsH1oNPrUeQ7WmVBP+ko99
 iPyk2oO0ZEaE3ssKORITuwzbHnBVJjjGzEv6yC8gb7SJMbvQWhkI+Gri+qfJ6bXdpy6e0aw5qee
 ULhFP4auS+GOZ3fbYXvGanfAQhaMin9RRCNrjGTY9oenrQTH5UUHWiEFHymriXez3a5pLGtSFFG
 8cBMD8SJ7tA5V/tHgklqqQj333TUxZld3z3NT8KiN7WlUk9FPpa0Ezzh/NnvjF7wX5OMaLaW2m2
 RS+eldftjGwV4DrldjrlI+/n+mECdZb8uO+B2HM7FKQTKQxg7czmRUGIptz7l4J9cX8rr2fxnbd
 ubQCeFy0SIz+UJbASHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDIwOCBTYWx0ZWRfXzX08cUOR0Ga3
 Hg010HJB1WM4yfotfGqYf87C/zLcGqhSvfcbTm3o46vsr5+vuxmElPvuAONT6fEuRgg/wPJ0a+V
 1airaJJ7rOQtPOJMAz7124sRB8Xf6c8=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aae9a69 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=JWOnVAuZ3AbGg8kBoHkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: SG5jLsfwE7MWSsof0swV7InMFszzU_iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_072130_850768_18FC87E3 
X-CRM114-Status: GOOD (  25.10  )
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

On 9/18/2026 5:13 PM, Dale Whinham wrote:
> Hi,
> 
> The WCN7850 in the Microsoft Surface Pro 11 (X1E80100) finds no entry in
> ath12k/WCN7850/hw2.0/board-2.bin and falls through to the board.bin
> API-1 path. I am looking for some advice on what the correct fix is.
> 
> The device reports:
> 
>   chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
>   PCI 17cb:1107, subsystem 17cb:1107
> 
> A debug print in ath12k_qmi_request_target_cap() shows board_info is
> absent from the capability response:
> 
>   cap_resp board_info_valid 0 chip_info_valid 1 soc_info_valid 1
> 
> chip_info and soc_info are present, so the response itself is fine. The
> 0xff is ATH12K_BOARD_ID_DEFAULT, substituted by the driver.
> 
> The names ath12k then looks up are:
> 
>   bus=pci,vendor=17cb,device=1107,subsystem-vendor=17cb,subsystem-device=1107,qmi-chip-id=2,qmi-board-id=255
>   bus=pci,qmi-chip-id=2,qmi-board-id=255
> 
> Neither exists in board-2.bin (linux-firmware-atheros 20260810-2).
> The only subsystem-device=1107 entries there are qmi-board-id=44 and
> qmi-board-id=82.
> 
> Using a different entry from the same board-2.bin as board.bin does work
> (i.e. extract using ath12k-bdencoder and rename). I have been running
> the subsystem-device=3378, qmi-board-id=255 entry, which associates and
> passes traffic normally. That may be another board's data rather than a fix,
> but it does suggest the firmware accepts entries from this
> linux-firmware release, and that what is missing is an entry under a
> name this device derives.
> 
> I also checked what Windows provides:
> 
>   - Windows loads bdwlan.elf on this machine, via the catch-all
>     PCI\VEN_17CB&DEV_1107 section of qcwlanhmt8380.inf. The same file
>     appears in that driver for several other 8380 devices, so it is not
>     Surface-specific.
> 
>   - That file fails against the upstream firmware with -110 ("qmi failed
>     to load bdf file"). It works if the Windows firmware and PHY ucode
>     are used with it, so the data is valid for the part but looks tied
>     to the firmware version:
> 
>     Windows:  WLAN.HMT.1.1.c5-00310-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>     upstream: WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> What is the right way to give this device board data? Happy to provide
> further info or test patches.
> 
> Thanks,
> Dale

Can you create a bug report per:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

Then I can assign that.

/jeff

