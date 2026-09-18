Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6319C982D8
	for <ath12k@archiver.kernel.org>; Fri, 18 Sep 2026 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=; b=0wWQUl2gYa3WWp5tE57MxuwGIe
	+MkSaw22fYqKZi66rDcUgulxU8n6xna1KL+11Ud6A+/Ao29spdTBH0lSZwx2vcQCAzE85g1OYA0VZ
	fSGdg3By43QBfGN3ezenEu2Mde07itTlyjpd8VLjEZcdBMeEyurU8HDfi+593gKkbspf7fHHwYqGr
	WFdyOMzaGRaiEI7LfNdWqgm3HwzsHMgy8/xJa2+a4XRMXr9eLWTJ8pw//TKT+r/8Xax+KKlp6MNUT
	fKvHjiubNSgW0L2dhizMu6oK1wJWkF1N0kmYSa87sdeYUERW79qdauvcVax3zb/Yzfun8BV8Ae9Jt
	+aPDYDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZRP-0000000Eh9K-1nKp;
	Fri, 18 Sep 2026 14:19:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZRI-0000000Eh5F-48Ii
	for ath12k@lists.infradead.org;
	Fri, 18 Sep 2026 14:19:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOd6I1353860
	for <ath12k@lists.infradead.org>; Fri, 18 Sep 2026 14:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UVIKTbOX8P65rHjj6Gpe9j
	HcXhIM+KLdiyQqTjwwzPQ=; b=DobeeqdU60kdMGy3DWDXi/byxGfySY6l20JjUM
	iMDRkWre2xMXVhmLSxpBdCvBMDKYgGsggnLMEd/BrUiY8ed6rD+rYpjL4e9GE7Ko
	Byt32oiN+dqu3SW/hskLiG6vob2vuFnhY6LBVchwAfVg87e4v9Pe2javI6yB7/sk
	DMGiwZMSvka98KyaWIbT/TcFOMKTfNz/Wd6lHw7gyZH1hqkjponf/9Hzr3Du3SZ6
	uHpkTgm/+X+vQlIzNPZdhFpWeASTkfklOqvYvFzaoGN0+MO/Ne5Kh4Z2/1uwoghd
	wOf2d2O6PQLWwzMTqly24/pRUzaSzsP0s8t5aVR/k3kk5ETw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv93yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Sep 2026 14:19:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc51591102fso1124572a12.1
        for <ath12k@lists.infradead.org>; Fri, 18 Sep 2026 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789741176; x=1790345976; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=;
        b=F9l6BYGqCCyjMKgV+uvWhxuJY767yd/MVRotN2iXkWXBJyyKwFzonpsU0zhAfj22HG
         76Sb27HyeqUnEGfMUKVoGeJyCb1FSQ9BpFAMUKGPs9tynu5siTH8A/NhaH3EgUHjT/MT
         m6AuPgKCTnNMiOr7SMLritzZ5l7UriN5PntzyDXM0CWeXXCPJfW5GkLlRsvwS8QEY8Mu
         bE7+pspFvyJWBLkU3OYUrwjnN3ApPWGXWDD/BhvYFHENZqdmH2UuNeFILGS/V2U2sxou
         ANNIx4XAGI/SmzXBYUyPznzI66O4yqrHuu5Lp0G/FWU7CBExp4Fi5A6bZhFM7kZi7j9i
         fn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741176; x=1790345976;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=;
        b=z3lvQiWOcizt74kBAgnBFemEe8+n+xWWNdfd/qj96HrZvYL4alNgms7QVd0uGXDRLJ
         ZEUb6KdOHD0qjn3n9tq+ddinsvLuGQk4wMVVkkFIsIEwgUMRPkESyMDfD6CbFMmg2uq7
         7NaPMziFDeuxBU117UiTVFoo1dwFd/XPaDLmhpK7fwMoN2W14+WeL6CiiH7FNMBgofjx
         WN5RaUBTyajmpTruO5KzbPIz7qaf+KmkHo/SEh/3iSIaEA4vu4AEGk491XE8/v3XPxxY
         ox5yy7XwYlS38TyCacU2ESTmQU0tu+odsBRxekPJ21CN6zDBiQGL7dqVEfYfa4hY51xq
         0fmg==
X-Forwarded-Encrypted: i=1; AKwUvByNd4ZWwQ3uFX2RRj8TGlwsX4YZncs4RZ5IXbXaDvgNcjOkPOq25FwEpeP0ua/enSOqr8SUgi8=@lists.infradead.org
X-Gm-Message-State: AFuF++mCpBY68iNS2QUJpLsgCFBYeLpIJFCBqMOwW3Xa9bsdVHe1e0vn
	OS4XYsrKy4pL4VvVtlgWMche/zwQBpDIHKRASUuw5put3OpctO5OEUsRnZ3ANkAOnxszdSlvnwF
	ED43FrXT+NCCVr3o+U68WrbdApRRmh/H0IyOj9Hv4Ln6jpUZoSRcaJe7iM+ssQMevLld5Nhhi
X-Gm-Gg: AYBFou1kz17YMucyVFVadt5upvCfMbHzVaIwcs3rzhmmxF3d3XTsS1Tse/ClDWiR6xm
	mDAJDXb1ptjdcgHymqFoawAkXFp8/mQS6vp3Zd1N1b1wgSAvcTVuLhFOn9XiLlgvEfjfRmX1COw
	u00EBunmG8MS1gnrfrn5M0xuPb1JC514boO/TXITcJhc44DZClRJ+JBSy4OxTrmBVBs65THCpyu
	yZ88411/RdTOb2qTk1IW0GNMwnyxbtK2bjyowb9rBXmeQRafAU79lchjY1K/x4sc5NXNw7Mxtx4
	j+kX3tb2JB0OXZWbP3W+vOcstubufgOakma+WhE9E+simi/ajcc3CpVhHPdR9wVBV8fAHRR1fMj
	etZrxNFEfJuOsfuyrwwSEouDg9OB0aZctrlr9
X-Received: by 2002:a05:6a20:eec3:20b0:3dd:a006:ed9a with SMTP id adf61e73a8af0-3dda006ee10mr109629637.48.1789741175767;
        Fri, 18 Sep 2026 07:19:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:eec3:20b0:3dd:a006:ed9a with SMTP id adf61e73a8af0-3dda006ee10mr109582637.48.1789741175140;
        Fri, 18 Sep 2026 07:19:35 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50c821bsm1100001a12.22.2026.09.18.07.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:19:32 -0700 (PDT)
Message-ID: <bb9ea6c5-67ee-402c-a007-46c9c7727632@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 07:19:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org, Troels Vognbjerg <hekatombe@gmail.com>
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260918
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfXxMOqDPDeNp+8
 nXlnKuJfXsiwAy7dwYMJWddyPprBP2zbv6laifOAhyD5ttYVXeWZnPiftkcG3ADCDFjmwNQb1U3
 CLVlfFpew22ogdCM9zWyzKuZxcoPvrc=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad4878 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Q1qRzZT12ma5ygSj1D0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfX0SynRN+t5lLD
 jFSoL3O+aH3Orq07Qn/ZQFWboPV+/RLTJQiEQjcDS5L+snB4+9DmpgGDEl/xrOJVKTlGeh2FHpS
 mcwpM2BpeojIS7cUPFPVyHJHuTREazOvb6YvisdkMMl4gV5ZQgI8VYB5U9FnN2VP8HmLVw9lZN7
 BF2mCNq0f9pHb0EtIgfwcFKgLzOsE54srSkA/sevr4dMfmFZPDcWurxMbhYHWcvRPlpzaRaQsEO
 SaSbE+aSx54syUEaGQBm6FnM1xgV8Eu3fgHqlusQKeXiAlltPqbxRo7FABAMdClk17Jrkg4Qu/e
 w7xS489XOBfNtmrF94R4/9k8XLS+d/1jZrx11Ft/ZdP+ESEk5OJGUP6gHlB81dlb6Sm3fG1y1jb
 oRfiV9WeG6wQSmLyS5fMSWL4P3yqueUEDyg1CefabQMfZHb+1eUYlcxNCClc5bYtxMqtm7OWaTi
 viYASapeOv+ZyIj6q9w==
X-Proofpoint-ORIG-GUID: pDz-AnGyw-sqoPozHQkt0QNq3xVSxwbG
X-Proofpoint-GUID: pDz-AnGyw-sqoPozHQkt0QNq3xVSxwbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_071946_305423_2AA823F8 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath12k.

For ath11k there is a single change that adds four records to the WCN6855
hw2.0 board-2.bin that cover the following devices:

bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=910a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=910a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=940a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=940a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=18,qmi-board-id=255,variant=UX3407Q
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=2,qmi-board-id=255,variant=UX3407Q
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=960a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=960a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=970a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=970a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=980a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=980a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9f0a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9f0a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17aa,subsystem-device=930a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17aa,subsystem-device=930a,qmi-chip-id=2,qmi-board-id=255

For the ASUS Zenbook A14 UX3407Q records the following tags apply.

Reported-by: Troels Vognbjerg <hekatombe@gmail.com>
Closes: https://lore.kernel.org/all/CAPMyOuCk7SEhPvcNNQ3ZMUf=uH=e3Pp0NHf6zLoakrSvL4qEoA@mail.gmail.com/
Reported-by: Mohamed N. <private bugzilla e-mail redacted>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221853

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit c9f6fc67b4833a0e4d0aee2554d637c49f997329:

  Merge branch 'eec-eef' into 'main' (2026-09-17 14:57:59 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260918

for you to fetch changes up to f8d2ffa59894c9f8858585eecc968d63aee6f46e:

  ath11k: WCN6855 hw2.0: update board-2.bin (2026-09-18 06:42:58 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath11k: WCN6855 hw2.0: update board-2.bin

 ath11k/WCN6855/hw2.0/board-2.bin | Bin 7237392 -> 7479440 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

