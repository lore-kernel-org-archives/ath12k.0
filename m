Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A82CFDEE35
	for <ath12k@archiver.kernel.org>; Thu, 23 Apr 2026 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H97jdc53rsSV9J1bHg93erHFl20K7pFWAZodpNuOJ0k=; b=cePI8qXStAnU6v4v6gy1xwza/M
	iSpNn/DYhOn8Jecw7f0NH3WGlwu8zlXuCbjVJYDbpc6voJUBy64Hwn+R1D4Y2yHg/JgqVc9Z6ZG2C
	tj/Q8T8zxetVeRCboXTwqo2Cm2sQ5Rh20QjMjSUVkAY2WlWAQ5xeP1XnDsXi1EtYcB1fAVunqJZcG
	vT0Jg6j5X3itYS4B1fh8ydAplgrumD69rBh3JHwrZXrxxYyWT37VtnBxv1miEoCTngQ8MdtWiRFMN
	zTygC7qsCs3foOHRe/oZcKIkJEUyWYoXFlTQPxHDW9fBH0PLK/iZXdU17FHbrDhwAowp+PoTsV8Bx
	VZJeTTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyMP-0000000C5no-3LpC;
	Thu, 23 Apr 2026 18:01:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyMK-0000000C5lj-02Zt
	for ath12k@lists.infradead.org;
	Thu, 23 Apr 2026 18:01:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NFh98l2319458
	for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 18:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H97jdc53rsSV9J1bHg93erHFl20K7pFWAZodpNuOJ0k=; b=ZI1iTMIFBVS7Mulr
	Zghrm51CWEAI8iqXz2kVEIz/mpxBfXbLdNPVHx05MOyM508eF0s7BjF3IMUn6Hea
	FpquPQ8eOV2Y7rP4C9uH1OBbDjcBLlHUAl22LeJXgmtt2QbXs/3YOdVkao9U9+Ee
	K2BCLWzwMVBFIK5EXTVgzp49Cg9/ad6TJRtCTs0EtX2J+SlZY7xHEeQ0pP8K2Dn6
	7iGEHE7lc7lu5GffeB7kcR+a8ADWbuLsQEATWogxhtT/mOLqJtt0GZgAQlgH9ae9
	JdlXZeghyQ//3kXDeu8LNo55T09cqL0nfod/93UBAu23E+J5Rql2vD7nymGdBcLp
	IWK7Tw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfst6wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 18:01:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0ba59a830so10926552eec.0
        for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 11:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776967263; x=1777572063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H97jdc53rsSV9J1bHg93erHFl20K7pFWAZodpNuOJ0k=;
        b=TALVInV2GCJpDmCXnw5Sw2N0I/i6up69+K0uC6orAeFjrfSlAL9CXWMajmfB0XKUIh
         G4/VYNFilLlvnUsBmqS263i8e6OKdLIUl912Nk4k5F6TQV5swb5yQvOBEl5PIX59qyKT
         1rgpUYNKEXxtBF1CmROGOWctIs+0rB0bqWb18AsvCM4pVr6mj5xK/4KloKAp6kTXwEXr
         YbahYJPEQlXeBDXHmM9ouPDQdD60MFqE+XvfYsWKeitMwTJ6Qnfer+xYGA8SHdqPfLcY
         CDxlRiWouL52pE7gM7JmZH6yDm+8DivxU/KhuVIW3fk22JpTEhnpvJQdmNPVtOQKCYeL
         Truw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776967263; x=1777572063;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H97jdc53rsSV9J1bHg93erHFl20K7pFWAZodpNuOJ0k=;
        b=MNnN6Wn9/K9U/BKJ5RiTp1ujhCDfo7mU/6KlQ2IY3y8OjPAtkgCIpEfcz/Ev6rglvn
         voStmyHulCRHZEGDC8ObVj0dQmPetZGX6VuAbnJ3tCj2Tn7RbtT3DEGdJv9qS2BDhbNP
         VCtZS1kkgy4tF1ILTqWE0tlbhwtUmWws7BZviz2XkXWYv6RGNsSXuyH51ri5loirWkpI
         UMmFPMiQRvVixLyRJ+EIffA2upHGFkgr+GWAd2r0B0EpcEt51QOBiJeFbnjPDGSsJTZQ
         cJYxZTAERVDrS7YvzncGl7OGl5FPGPvkNW5aaeQyAyLDP24fuNdXDqMDEbhORdlE+CPY
         RAPg==
X-Forwarded-Encrypted: i=1; AFNElJ/YP8scRdkpwGkEZ5xaP2Bu2rrTAD2MugE+1849vyChDa6LzhObJXlwInS8gA2rHhn/zoQX058=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvfcSpvqJGEOGD/05oLgopWZEkzKMXiQJr3bKQAQ0uhq2n47EV
	A/GXn+9pXD561nvwPVNDwxsoaS+3ZXa8LmgdGeyTITXXyIXKi9E+8Y3nZEwv4LfL831UTfCeLc/
	xnJ4Ufg9fdchC9nokMpVFXZqfac7vl6+2nvg7FkbM323bJpXlOUhQrMcXsxnQLFjK
X-Gm-Gg: AeBDiesg2qMe0TKFQVcD3iKUgT9bFPQqahxtI4oktuNj0jgHtq6LMJb8I7DM96BWOL5
	hofWXTa/XxA/cD0uG75Jge27qYJFJ4DJmXoyedCIoLaQtkw4zf+KgPim8GSl7K3tSgqPQSb+Zuk
	CyiAnqLgdwvqCqcVto51DOKH/YaNKVe+wdlR14hTCIzbf6C34Av+93lKNAnNWI9j5NPgJOCWXFY
	OViS0uJci2JiFTgFb4ErXoitBq0bo+OnILml6q4SPzkZZTXsixpxMJwS/g9pNRoQ03ikiqxbFsg
	1s+KxTyNqP1t4ODkAOWBTIIKKk45PftOC3g0GodX2fNVHjRLz+aQGzXtcQWG/JgHnQByR5XAW8o
	ANIqDyYcOZQDQboppTKZCx5yGhxSwcV7Q4Nk9hxfHI8vhJULzXnqhqQBJSU0T0akc4nsg0jRhww
	YlpNr4VEtRN4E=
X-Received: by 2002:a05:7300:7491:b0:2d6:4297:5fc7 with SMTP id 5a478bee46e88-2e4872fb657mr14968520eec.25.1776967262762;
        Thu, 23 Apr 2026 11:01:02 -0700 (PDT)
X-Received: by 2002:a05:7300:7491:b0:2d6:4297:5fc7 with SMTP id 5a478bee46e88-2e4872fb657mr14968475eec.25.1776967261658;
        Thu, 23 Apr 2026 11:01:01 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm27867887eec.2.2026.04.23.11.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:01:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        Yu-Hsiang Tseng <asas1asas200@gmail.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
In-Reply-To: <20260422180814.1938317-1-asas1asas200@gmail.com>
References: <20260422180814.1938317-1-asas1asas200@gmail.com>
Subject: Re: [PATCH v3] wifi: ath12k: use lockdep_assert_in_rcu_read_lock()
 for RCU assertions
Message-Id: <177696726047.2493545.5792745669762197871.b4-ty@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:01:00 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: kCemfZHbABb113YnubJFVZTSIMXS5osV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3NSBTYWx0ZWRfX+d2hOIbLZzj2
 6Fi7SIx+iqlaruQ2vMtnR2FzgPkBZRrRkn6t4pN7hvDWYiwLiJv6zYrxnWPDWsTjBiaSx9ecZFU
 ydyI4Xz+Z5JM2EE0cnCY0bJxud75rBitAWbaXn+J5DIK333rxBw4D+6z7iItPobJBH5IZVimqp0
 GjQfMAIYFPTt0FaN2o4NJggbGeq037I3oNNcNTGbpFOf/4vcuixmplO6WVCQ2PoLsoK/SMXrN7O
 UXlpNOLr4sIj72u4/mkWiBWp/616kK+2jNM9Y2z5pmU5CpAEhYZo72MlPiCgPpeFw7PUe5to49M
 2O523ZBXEshpUbKLhODag5TyhRGl7L2mvG7mQpaNXjwpgY9FsLxRTQQq6OaWn2fm56rGSpx7CTV
 dFa2F7lTtFyE9a8JiOiIvrr2j/GVaZ7JOeb+Qe98Jgt+YtU+4NR+ht8r1SdkMF9pQ3jMDhpuOSZ
 Ft96VgKK6UmPMONyRrw==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69ea5e5f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XjcZkKkVyDdEEfN8XZIA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: kCemfZHbABb113YnubJFVZTSIMXS5osV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_110104_079930_6C37A163 
X-CRM114-Status: UNSURE (   8.58  )
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


On Thu, 23 Apr 2026 02:08:14 +0800, Yu-Hsiang Tseng wrote:
> Two functions in ath12k assert that the caller holds an RCU read lock:
> ath12k_mac_get_arvif() and ath12k_p2p_noa_update_vdev_iter(). Both use:
> 
>     WARN_ON(!rcu_read_lock_any_held());
> 
> On kernels using preemptible RCU (CONFIG_PREEMPT=y or CONFIG_PREEMPT_RT=y)
> without CONFIG_DEBUG_LOCK_ALLOC, this produces a false positive splat
> whenever these functions are invoked from paths that do hold the RCU
> read lock (e.g. firmware stats processing or mac80211 interface
> iteration).
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: use lockdep_assert_in_rcu_read_lock() for RCU assertions
      commit: 4498664e2d5888efabb96428196a926acdaa25ed

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


