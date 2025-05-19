Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FFBC2D0CD
	for <ath12k@archiver.kernel.org>; Mon, 19 May 2025 18:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EvE717nSURiHJFlzxR4FQmeEPs6Iqvr2ySq5HbVy9s=; b=mmUhh92uEqOQ2VK0x03sO8uVMb
	K/y8q2E9qp+OMjMLszReAzkVR0Ulq3ogPbOFoiD/QmPxdFauLY/p7G75iHI8wziJknsunRr444AHv
	fDPM6ZEZKJfn/bQl2uHyQpFEEVwTRLqTDiSjvgo0Q7Hy3eZR0ypd0Dg66G/T/09+8oLMOXB+romZ9
	ZJg3qwMv5v0+NYwZEKA1yx0BXZpMOvwooCNMl5Rez0QvjSLxNrgoDquScebxPuuRIOhAoj9IMPgU1
	QPkDt2mCyGdBPQIABeuxFcTXDQhT6IFerIWfQgvD/MdzQYkZvxf9eo8fORuBKMmvKx8dR24zWni/+
	/PHowkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH56b-0000000A7ju-3Zph;
	Mon, 19 May 2025 18:20:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4ay-0000000A0vj-1qBc
	for ath12k@lists.infradead.org;
	Mon, 19 May 2025 17:48:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9aPOf006697
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EvE717nSURiHJFlzxR4FQmeEPs6Iqvr2ySq5HbVy9s=; b=DMrcCWiWYpRTnJ5Y
	Nii4FXwK1pg1FaUeVsVgOk3OQu7e8sFyb0MmVfarOci+9hKrBklYLOrAeL0SAKdt
	2/r+8h5NFXGfa3daU1smsxXXQSY4XJwXffkx9FpR6/COnB+MfoPernVkpTEl5FKQ
	06JZqZB06iYXMUwdNriht8WUVTz/S6rM/7LOebSOb/GFQxzlNUHxo5iWtDdamvAK
	qBrB5qRozCwThnQskWrFPyF1vb8kSczmJlE1oh4d181xkYlRxM7/AZIItSVU6QoH
	ipVC4SIGOeJ+CxV2+QK4Pd2Rzk8uY0FRmBtnFWYDTH+UsPWDMQixtmoOokxtgPa3
	XA4GNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4n3v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23201f062afso17462615ad.1
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 10:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676890; x=1748281690;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EvE717nSURiHJFlzxR4FQmeEPs6Iqvr2ySq5HbVy9s=;
        b=vtKPuDYlgKf+kjb/IynA+/gLjROW5WD0C4w+69ND/AYQjXItRdWgCieA9Y13irV1p+
         VASq4pp3COlxS4tH0B7pZ6vUFAcgm4kN/I4qNqAFtltnBIIuDVen44yQFsbgJj92E+Mp
         Ypf0HYjPLnU7ni+exjvFzZjxOc3HI3EvhYZW5pfe5hDitEAVxnnGo3OEBjRTL+yr4WQ3
         M1AkpGpf26SRFI2yKPaRKYDIDC478SkDssiQSBlKqw7de0+FhRhXr0Xfkjwut6LOWFxO
         ELW1QQgeGm2E2ym0Loe8mc5s7+3fUZchawS+1GPNLZukcKyWhWvbAEgx3zoQliAtzVVL
         gT4A==
X-Forwarded-Encrypted: i=1; AJvYcCVEAMHryExLknEq18gdbZfxuxKD4CXlK2eBIj5n25AWmgh5GejWBMYXe5ZsWyQEGTL2rnRFB0U=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlo5Ix9ZQxhaCcKgS3a00dVkpkpuZMtIGsPiwhJzqENc+89LYH
	fB1GLVwZ/LDZncabTIR+fGl7Z796k9gGotfRvQtfTBuzOuYvD7QRmCUeIqhQmP0c4qhd/wbsroQ
	rliB0izVhk933yv4QOXQ+c0iEHI2j/bsxMa+E/5l6RW7K+tKftDezgRN49JO3RKwr
X-Gm-Gg: ASbGncsaJbqKAzkFhn/6Dd+McM9IQ/wrZjeFXE3MrzarS8u9hvv3P42Mq5YNT0oL2Xq
	eTro1NX7sZtxUy7Rs73t9NcdTgU4oBO76g8h9m/r6r3nOrWPpPc15ssiMgQ/1sI3tUd42oZkUEk
	MQKOFX7CpWEiGUNXqeznbk2Ar9/ATuvx8dPl78CZx2hOV6wDSYu8nOhNroE7orrfyGgLPyyiPLi
	cRnW6vsWzkhY7lEWeCXNPD/zuXhx+z7jzl+Ds2pNS8uzARYS+jkjRCsLZRvyl8bFWLB9Jtkx3KZ
	a9RF60foxh1yj7SvPaAW3LFXhbkco0nI96ZDWVEjYH7zPh1a
X-Received: by 2002:a17:902:e84e:b0:231:c9bb:6106 with SMTP id d9443c01a7336-231d4d057camr192248255ad.9.1747676889862;
        Mon, 19 May 2025 10:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNW2vCmCXCEGgZCIscf+26785zhmH3GyWS4omLFzEgXb2bZGYtEkjCKGC/tS8DJuBz5Qr+LA==
X-Received: by 2002:a17:902:e84e:b0:231:c9bb:6106 with SMTP id d9443c01a7336-231d4d057camr192247985ad.9.1747676889486;
        Mon, 19 May 2025 10:48:09 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:08 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rajat Soni <quic_rajson@quicinc.com>
In-Reply-To: <20250430-wmi-mem-leak-v1-1-fcc9b49c2ddc@quicinc.com>
References: <20250430-wmi-mem-leak-v1-1-fcc9b49c2ddc@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix memory leak in
 ath12k_service_ready_ext_event
Message-Id: <174767688852.2567051.14152574284720219609.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: R4s_xrxSRwQ_QAMxeVAHBd5viHsCXOgm
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b6edb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=FhvEbofts4Y-0ieg6voA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: R4s_xrxSRwQ_QAMxeVAHBd5viHsCXOgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfX9y/K3Zhnjb8K
 MGBWJ0rPnTzqOvUxD+hNdfeO7gQVjXGgX0DotI2ZZsVAcdEk8AcI7ghzdyvMtX6bCBKc7Dm1P8+
 r8t++fNdNO5QVyx0VdYLZ2scMhTMWuLNvkPjZSeAYhZ8Lcm4IOCHjZqaQwKpWkCqnlC2MxaiTO7
 2sOoHMy8sRyhIf1LhjdRuKaSRGx0wffEFFCloP8ao+80FYe5cg5gUtdo7m1dWufHBWBZNGrvfEI
 maAxbkjnrJ7WTPX8kbtn+dsxAAu5l7N3w1E7rAEc8+fV9QoyI4PZq+3vTMRSx12na0y2iJRYFvS
 ZMgUM2xc3oV3h+Hh31opLG7hfyylnDfEUt/Q7J2b0ITBBWTiNDGKEq372/UshYAXThRFFwhN4gX
 8lkN0TPGIs1q4ZNPzFUvTSW/UuML2iVciKmvbF/1GScecfFIe5dYa1mtrViCOnoNDVIlpAAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_104812_609935_46FFC756 
X-CRM114-Status: UNSURE (   9.85  )
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


On Wed, 30 Apr 2025 10:25:38 +0530, Raj Kumar Bhagat wrote:
> Currently, in ath12k_service_ready_ext_event(), svc_rdy_ext.mac_phy_caps
> is not freed in the failure case, causing a memory leak. The following
> trace is observed in kmemleak:
> 
> unreferenced object 0xffff8b3eb5789c00 (size 1024):
>  comm "softirq", pid 0, jiffies 4294942577
>  hex dump (first 32 bytes):
>    00 00 00 00 01 00 00 00 00 00 00 00 7b 00 00 10  ............{...
>    01 00 00 00 00 00 00 00 01 00 00 00 1f 38 00 00  .............8..
>  backtrace (crc 44e1c357):
>    __kmalloc_noprof+0x30b/0x410
>    ath12k_wmi_mac_phy_caps_parse+0x84/0x100 [ath12k]
>    ath12k_wmi_tlv_iter+0x5e/0x140 [ath12k]
>    ath12k_wmi_svc_rdy_ext_parse+0x308/0x4c0 [ath12k]
>    ath12k_wmi_tlv_iter+0x5e/0x140 [ath12k]
>    ath12k_service_ready_ext_event.isra.0+0x44/0xd0 [ath12k]
>    ath12k_wmi_op_rx+0x2eb/0xd70 [ath12k]
>    ath12k_htc_rx_completion_handler+0x1f4/0x330 [ath12k]
>    ath12k_ce_recv_process_cb+0x218/0x300 [ath12k]
>    ath12k_pci_ce_workqueue+0x1b/0x30 [ath12k]
>    process_one_work+0x219/0x680
>    bh_worker+0x198/0x1f0
>    tasklet_action+0x13/0x30
>    handle_softirqs+0xca/0x460
>    __irq_exit_rcu+0xbe/0x110
>    irq_exit_rcu+0x9/0x30
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix memory leak in ath12k_service_ready_ext_event
      commit: 89142d34d5602c7447827beb181fa06eb08b9d5c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


