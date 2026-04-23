Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BFCFC0342
	for <ath12k@archiver.kernel.org>; Thu, 23 Apr 2026 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9CDZxY+AicG+LQxv/gyUZ+B2R4sxcezOhmQw6qqkCI=; b=bgh/qMwrLRQ0tDuoeJMaEMV293
	YUqBUd/ieR5NoqFdLFKkwRxS0SKhJzgpnxspmZKJEt+G0BhybMqPPR5XZJeCPqdhnqu74G98RboHr
	zzI9YcT5hlfULIByM/Igo9YXVHBSzi5mXYOJ+hnffflF34py2U5X3faQbb9Dn2+pJmOp9JsgTo/Da
	4mWTCFg7Lj+9pjhmGIBbM2l7qX+uDrlo5yw4mB5KrxJwaFUYi9aoo1v4cTakaK4V3TXsL5VIB+00P
	6/30KqotfZUEsqycWEjBopYGhUsQTqAMyhvI5/Ht95J91re6GsIidPSMzERTlchYarVBj5vgtKsop
	srJ1tUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvvB-0000000BtbP-1uqw;
	Thu, 23 Apr 2026 15:24:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvv8-0000000Btb3-1qCh
	for ath12k@lists.infradead.org;
	Thu, 23 Apr 2026 15:24:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NFJBHl1204781
	for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 15:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v9CDZxY+AicG+LQxv/gyUZ+B2R4sxcezOhmQw6qqkCI=; b=Ms53WFclO/JSYHXh
	G9H7c4JvTFg0mYB2H/YwEI+GFoa7f5nEaqHyaPo4mbb7M/jyNr71gBBfkTVx4iDo
	1CvJvQOfHP04DflpNRy46px1dhh99My050bRb5qJLyAG+4iozitW5YK/LSLjmlGh
	TMVFd649e51uyqyLlqIgjOcUGebRbMuPmSnp1qdW3KgvpfbgASBG7hKEqEbLUAnR
	4PMeeuW0kgmqZyZH3N3eYiKOtxNK0qsloxuM6gf4kcRj6H9WaXnBEGFd0Tz9Ltcr
	BoumYGhQBOW/ThliQKoToN+s+EgX5PXnmZ+t9wmApU70yKWDUTSnsM4q5gv4rolB
	+UmEyQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqggn9h2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 15:24:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d889997495so16058570eec.0
        for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776957889; x=1777562689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v9CDZxY+AicG+LQxv/gyUZ+B2R4sxcezOhmQw6qqkCI=;
        b=fu6Cb4/UHwd5A0MMYMGiDHVDibYP0kr+laPQyPMUgz2syHemDJgT0g87UyI3sIxVBV
         LIybMgNN1tNlHARwqr9RZn91ltmVnWUkGIdrDNthC45F9MDQ9Pl/nW+xPx4j7hX27tdR
         C7VZGGIf/+EDU1Eb3qYU4ouO1RuBR12XVBu6xoDCJjDE6fnN7IXcM2igEhCbX+IU1P4M
         FUIsX6a4eJbCYc2vU1+CLocOe5X/h2/+ur2sP8al/pbssuYNVPcYUPq6GIxBjzEqg4Ik
         /fFV0GO2PPYa0MqsvGKDSxFmqDuY+7T4GhAEl3ozhjxa8x7gFIFk/IBSdQBP6qCf3Ruz
         tv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957889; x=1777562689;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9CDZxY+AicG+LQxv/gyUZ+B2R4sxcezOhmQw6qqkCI=;
        b=XOH3Y6/jlLQKUxAv9tHW+r2nepP0NQkxIKQtCp9SWNrwv/JiV+3dzWDLmS5aFnACbX
         /PIZXvETVnw2O4lYprv3e0+llDd5DpuehisaCg/AoWHlDpSktxEDm0aUu6nxKJznSCKW
         mgbtp9Gh1JzhrWTwhOA6lPiatizc2a7A9lYf6jOr6qc4BlwDX5b8aXP7Mfa6FBilvimR
         vJBONeqRgCFRf5VhIVQuL2fxvYY6efC5gwZJCxrp2+YyTSLd1Yl5xqOqK3Kg+t/oV/66
         d2cEHQmUisUzXWQ6H7SuxpD9TrxWD58ecIBBPijrOavHWMa5Y7fS4N11d53VHteGiN52
         /o5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/YaMm7JIfLnGFQBv8gO5NT1wcS88aZ3Ja/Hu64epAzuM4c8mnyRSDbtzzceqHM0SXWHhfFswY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYwugUJr5OTSpTVuXjualaO/g2UMCCiipI7896iTUya4NQoBU7
	qlGn0vN4595yO9F/L3sbSYnesT+ouJ+CKDcohExmHBM0im0tHYQCMEnJtXSOHubmqnVjD+5XrcI
	jXeIrYViZrv3MAIFiuSz5oU/do8ve+7oLRhyOGMPWVsNAcrGvlSvvjzxJS8vo1rmf
X-Gm-Gg: AeBDietDqqutAWA83ArDHxmDb53bLIjunfuMyD5AT+vzw5NMmbpVmqsAmiQLQx9CFmn
	6LUa1shG/PnqKn8arizAjZWAVXQhDSopKJi69bWxmP1YGJ/DPnxh+BuABBkuw2ZAeW2w9UT4Z5O
	yt9tfgiSr6BZZsy21RvJRg1zisQggZNvDigpD9NmObEP+jsdcdtrZPVf63eFtPNv6viJ6Y8/BMa
	texDYyLRUYXLgRfxVcbgOxHHGdfl4p5Kq1UugFlGdCQTEkjPANgbtQnZ3aAeeU0Yk4NwUh9z103
	QlmzHXyRMCGJUhyJW4AiB82RgLG6VltSoNcgqe5C4Ug3OpMmkTOUoZpjZKxpJ35GAaj+br7Der/
	Q4OTDFgZx87+hMyY3X3kayhtjeSNkzWtWUJA23tZt7+9I+kz16CFelwMzTUI5DDnE/WY42T5tkU
	f6Gc42I1H3O0F0zTH8
X-Received: by 2002:a05:7301:4593:b0:2da:10f0:a8de with SMTP id 5a478bee46e88-2e464db026fmr15176443eec.8.1776957888914;
        Thu, 23 Apr 2026 08:24:48 -0700 (PDT)
X-Received: by 2002:a05:7301:4593:b0:2da:10f0:a8de with SMTP id 5a478bee46e88-2e464db026fmr15176418eec.8.1776957888236;
        Thu, 23 Apr 2026 08:24:48 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e7025cf413sm23284279eec.15.2026.04.23.08.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 08:24:47 -0700 (PDT)
Message-ID: <caad3b9c-2c14-4e09-b8f8-840d2ec111be@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 08:24:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: use lockdep_assert_in_rcu_read_lock()
 for RCU assertions
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Yu-Hsiang Tseng <asas1asas200@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <20260422180814.1938317-1-asas1asas200@gmail.com>
 <20260423063020.NAero6Rz@linutronix.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260423063020.NAero6Rz@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WDMJVuEHzkZtZd1JfgkGzqEIOpVaQUnl
X-Authority-Analysis: v=2.4 cv=YZeNIQRf c=1 sm=1 tr=0 ts=69ea39c1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=Neo_AiBHE1Wlc-BSriUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE1MiBTYWx0ZWRfX5zqDcaDq3Gwm
 enZtBeOztKmsmL+tWylRJJ0RLCjvry02mnKI/YcPvo14p8Ptjx0hsPL/rbQh+W62bKYHPRZH3p/
 FeSia60a+9QSkwqYajesCNTjwbE7OgbVQu08Js5GGD1AWLpX2QJzKcb6eOHluQqdRrffKHNREUg
 1fDMFt++60MKSYjYKWui7ORk3cVHcKGY94c51Wymkzlfz+LMccdIafSrmASV0d5VAnx2RxYa9m2
 SpjGphRe3c+Q5XC8CadbV8AqnPw2R46AanUDoh0hy6m/CMo6yd2KjSZsCU1GAEHw6diTuNBSI1S
 gWxE+qobytCf94O5Ts9y7ZUL0W/lncTGGsSrEA6bFLN+E6NhguUvvLeL1EfLlEL9ZcgyoUWFKEV
 mElSA+YDNbA7sqduAV8VqbxlZ8qnC9fVqu0AiaxecYLzVhRRhyRHrDPhdUDFvYOk90GUZ64c3WF
 xbhPgOKMhY+RxAWWd1A==
X-Proofpoint-GUID: WDMJVuEHzkZtZd1JfgkGzqEIOpVaQUnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082450_504190_68CF61A1 
X-CRM114-Status: UNSURE (   8.61  )
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

On 4/22/2026 11:30 PM, Sebastian Andrzej Siewior wrote:
> On 2026-04-23 02:08:14 [+0800], Yu-Hsiang Tseng wrote:
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> This could written in plain english as in "Tested on …". Not sure what
> this "convention" is but anyway.

FYI this is a long-standing convention for the ath family of wifi drivers,
dating back to at least ath10k:

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/submittingpatches.html#tested-on-tag
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/submittingpatches.html#tested-on-tag
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag

> 
> The change is okay.
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks for your review!
/jeff


