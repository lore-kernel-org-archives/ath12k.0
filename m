Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A108ACCF9E3
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 21:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hV4TJnZy003p01qOwxjpTM5eHNGSq6i1ulLjp3JllxU=; b=pdPKPjQskX739tSCoLCbI/uGfd
	n5c8MSpg+NzbCWfdMFX0/GsD0ND3Yl90Gx8YFLYMfwW5+NEkg2fPFj29xiGzte1/T8dOG3m/Hn+m9
	aCf5T27Y4GdAl2P1bHqRJ7XBNMN0mhUEna4vYm2oSqmhK5GbfQcSScpDxUHjhvwQJsw3aztl3bfmB
	LSilkZTNDY8UbI4t0TaNZp/5v1+hhMQy3dZJ76zUk30JQmz45EjRAr1RlOHleBCU7Tl0d3tfdQ1jU
	rEtrLQkDng5cZPjAnTxhcT8XxNZWhFg9zt5g3FUblVTni7hZjhcoXAztKY/1H2I5JSgZ1Yib9I1MX
	MDtocuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeV-00000004zq0-0yoX;
	Thu, 30 Oct 2025 21:57:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeU-00000004zpF-038h
	for ath12k@bombadil.infradead.org;
	Thu, 30 Oct 2025 21:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hV4TJnZy003p01qOwxjpTM5eHNGSq6i1ulLjp3JllxU=; b=GDphF5niavhAvurEhdb31ykUh2
	Jytly2ugG2Gsz8eAt8RX/NvQJLNFZk26TN0l74LXSiXUuLECp7KyluAidO4BzpEnEduUHT6P9NQS9
	fHPwza5CxW23VKeHPEzJrbyqbgwMqMlCDDmr5VZp1tDbwRGVlEUFuJhJOoaFyz9VpbYhZurEWuYh9
	1qiv4HFzVevkKubsza/RRh5/4L2830w+j5jtHLdbk4AiYYlPL9tRx388WrKTQ3ZMso2JdCi8yacMR
	TimjELmwgu5vE79Iz2bBBKZp1m3aeTEVm0lMEonB9k4ibTs5Rm7Mx5m0+fGeW4c0X4I6MpTM7bLZ2
	lqyGNcJA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZmh-0000000A5Jd-2UrQ
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 21:02:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFHIVU102774
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hV4TJnZy003p01qOwxjpTM5eHNGSq6i1ulLjp3JllxU=; b=ZcvOFKz5DgW4X33D
	1G57y47VWGpoFFxeChP6uIbp6+2zi8NxOHLHEmLEIqqjr5EOA+1uFqBEoXLoY0RQ
	taYBclHIDGHCGFA4hrLvXxImutPnlgv77YNN56gSyPj+mkb19j9f7oHoSU/KN80M
	baya2XTKBcTRKjfME6JSPZReYquWr8RhTVV4cgwf7UsYr6ok8llAUSn9nlIO/8aO
	5N0yXIQsj6o5P6OEeqTlnuFylFBRQy56O0FXGd8Ko6pDS5k39MT7hO0L2Gd7HkpO
	a9OEuAB0+0/qRN81m81uwTMd5vIhekpsQDw4XcXEE0UgiU9X5uwV+6rK5WpLWqga
	ziPO3w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdh3ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-294baa12981so20187405ad.1
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761861464; x=1762466264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV4TJnZy003p01qOwxjpTM5eHNGSq6i1ulLjp3JllxU=;
        b=Hcuht/tv2zO3VpcoL43rOSf3LSSgMlqr4CcxzvWu6AsM8ULsbJec72qEHDTtoU6ZL2
         wzoULj78eRa6Ti/zzbksdWj0RCg81WOfw5Iham82Pnqy79fCN9foIdqfDMFXKecyrSVt
         E55Jw5ttyVMiKzjvPh8dUoNM9ZUWXK/Rf+HxaNkb2tlQQZBX6YyqjOqMzp15HBf64J2K
         GylhvnJxUsH7TASpp0BZ0uMw/tTpvVoBFH8fyvhGiXCFKsqM2T/Ms4w7AuTbR84kJRov
         WxfVSVuYqYWLABe4cR7TbaG/rdtBjxOlT2CXtqkA6L2jJHwiL06npwruNpuke2Mslaep
         0BAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861464; x=1762466264;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hV4TJnZy003p01qOwxjpTM5eHNGSq6i1ulLjp3JllxU=;
        b=hiRMh6WUzBtkJTCw1rGXs397O+R+tzhrEoQmwuYhSxGP9shaZF6Qz6W6OkOTZxZlit
         VpIFFMCBzJF47Rey1qjPmEzqopkBk3cx2lIJsjxlwrSQkzZMz5yUOeKiEOvtxU3sx/qw
         ItJCT+e5qsyp6G1H7TeG49d2C95GhvU6kpnnvRG1raoR+hTHiJCr03wn7TY4b6qEd4NY
         iQxF6fel879bMHqTWK2jBpv7jQX/kvQVP1+CsvxvuZJIHpLafSZHNunDVazN9eegReg2
         kQcbXVq6MyDe8GndP5YxuSrlly5lo7klUJLt470BWnFjgj7e/x2/+LNNqY3PDU8f025d
         c7Lw==
X-Gm-Message-State: AOJu0YyO4drCmDTqGkthqW/WVMnwy4wPg3NcBtk+JUyj5YR+KdS7Cu9F
	A+ucADdsG1IpMxu3ZqDY1ev7/20wLJ1TNarHpBEf5VRedxCVA1kIX0fhjga83O80aoeBOyyph6v
	LlsIBEkYWIuSP67v/pqwu5kU8ojXgZ2im+7dTOAv+mmdcnKCKxUdPKh8mMPnBLeuZYfHBRhjr
X-Gm-Gg: ASbGncsNCcVxGkYAwo0zvI1EZJ0KofRcr1WozR1xArZ9jhoQRX1Pcjs+9Qx2n9okmR3
	A6RAvlUntLueuEGbfVJWIWsIUMP0rErZHJFmGsxBrppFbkBcW23PX4c09no+GeLmPANMg1pzGun
	wlyBJH+kXFo3wQTlP/vMzgKD3IY2nAHwH5uMtQxT5qKDat73VoHju2W1DhRvS+xXvhzp9LiEvx3
	WWo+IbRgW19JHPa9TqH1ypZPNCFrM1uskXqfYtGh37HVPZ7ZHRfuDpT8HdsSSZ51oV6BR1YBMHG
	V8ihZ8gzIHeRP1PREaNgKEr/tYPVbegk1I0sj92y1WoMdyBoPGVmgj8SVxNyuqRVTDMlcdkUdk5
	PyrAz4lXsEizCGBoqFIBtZ2J8F9/NAw3b9tA=
X-Received: by 2002:a17:902:f68c:b0:294:f745:fe80 with SMTP id d9443c01a7336-2951997843fmr15578895ad.17.1761861463781;
        Thu, 30 Oct 2025 14:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+Dv8e1sndqFqNh4yuq4W3q3wAiuZCj/C/52iD727pttcwzGYHvSQGhVukGYCDgPFp+4MFsw==
X-Received: by 2002:a17:902:f68c:b0:294:f745:fe80 with SMTP id d9443c01a7336-2951997843fmr15578635ad.17.1761861463232;
        Thu, 30 Oct 2025 14:57:43 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4a53sm201868405ad.6.2025.10.30.14.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:57:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251026182254.1399650-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20251026182254.1399650-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: handle vdev create errors
 and ensure limit checks
Message-Id: <176186146262.3489476.15371664880131261602.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 14:57:42 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4NiBTYWx0ZWRfX6CjQfMfUhdXY
 0Y9gkTyVSPXM6kb7Iuz/MvyRghOdFzKL545rS+DiUR3jEZ6tKjGSpUajr8eEmaanEaQkRXpLphp
 bm7d7UijaLJ1LLHl6BBhFiud0oLjA93TE54fPO+M7b4AHFTvY/degu2Okvl8KbTmDt1KgUCkXrv
 nWSEy1u7mGBzL47tFAjyNz3HpRmgqxzC3EgRvdHosU/Q4vskrbPhPGJnSObNFbhLna2MVlsimME
 X4QEssoDNZ7plvoL0x7JcRz/JnzKZhuYtuVU7dbscUutwB/0TjaGmaGsvP583TGN6Py8eVjJEF8
 NAwoPzk3RIYf/pYi14EdVfmDjkA8Mwz6eMDAufsx7hKNt+CXylBs5BVQeQ+73tUxkSZnu2sHMxh
 SBI3L9iGndyEQaxkDoAENE46KePD/A==
X-Proofpoint-GUID: zrMfE2ikTE4p2CNj2imGf4az2CAMvO1n
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6903df58 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gvBvQFtS0oAN2tB_OWIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: zrMfE2ikTE4p2CNj2imGf4az2CAMvO1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_210216_295632_980826EB 
X-CRM114-Status: UNSURE (   8.11  )
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


On Sun, 26 Oct 2025 23:52:52 +0530, Rameshkumar Sundaram wrote:
> Centralize the vdev limit check in ath12k_mac_vdev_create() to prevent
> exceeding firmware constraints and triggering asserts. Ensure stale arvif
> is unassigned when scan vdev creation fails during scan and
> remain-on-channel operations. Return accurate error codes to
> improve error handling and cleanup.
> 
> Rameshkumar Sundaram (2):
>   wifi: ath12k: enforce vdev limit in ath12k_mac_vdev_create()
>   wifi: ath12k: unassign arvif on scan vdev create failure
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: enforce vdev limit in ath12k_mac_vdev_create()
      commit: 448bf7b51426bcca54b5ac1ddd1045a36c9d1dea
[2/2] wifi: ath12k: unassign arvif on scan vdev create failure
      commit: e70515039d44be61b6a73aafb401d141b0034d12

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


