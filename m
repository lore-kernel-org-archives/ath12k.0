Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26B2C88E40
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dg+vOyYVeG/J+KZ5n/59eHOsMGy/Fco8k3zSySXeruM=; b=HXs9rp2Qqlutjxrb6bQ+EijGOA
	2ThiwZa7cYG+rngoKPgz8SEYLDvLCCCIdwT9teqmfT+D35+Xo0xu5DQEFw67S9o2jQ/WFo23F8vZx
	u91OkisBakGsk5aIzciBMhf/tblL0vGBEizXn3JBlPI7RLjPqENf8j7fJiVO+vWb9tuJ3Ysu/ZeUm
	4iF97873LOtnvv/fOuDUe7CmogVEPqC2yGVXLFaTlZnrJWP3AUey2Xl61/DtDxe2sym1KW4P0EmSL
	46iSqPYPY+FrAaQKsgutmCJr6CZ1XanryqFQanhZjdSQYJoPHt35dnIzvkLcghgVgYgbCbNGTX3bS
	As6NWo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYc-0000000CYYR-2KF2;
	Wed, 09 Sep 2026 17:58:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYZ-0000000CYVU-4Bds
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 17:58:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7dCC2600152
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 17:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dg+vOyYVeG/J+KZ5n/59eHOsMGy/Fco8k3zSySXeruM=; b=Lb5Cfu0jwgIZzuWS
	e7Q/Fy5TlFi0e6pi1OEdS+i3TeG//HIXGQi6WR4s9DaJNSA0eix/kzTR8k8lSnEt
	ywYM2/JD6cn1DFPkcqCc7U8DMAeDmBlFzJ+lbbhVTOdf4EcoRp/HPEWtJ7oqX+pW
	LeO2YSa3mwyj2b+6fhx3Dxjts3ToFJcMiwhE8lelvv5F89H5aBO2tVB1CJEon/dA
	55tLN7ICh76gg/Ts/yhsR+0he0/hpuiJsuMrR1G/31i5sqBojqRrkA9Z7Wec5+rP
	QFisbGVuf3CVPnw1HifGduY11abp/bCrRRfvYXxQp0AIYbYiInqY0MfZibVdLmK7
	yg5idg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r1ewc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 17:57:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so414806a12.1
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 10:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976679; x=1789581479; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dg+vOyYVeG/J+KZ5n/59eHOsMGy/Fco8k3zSySXeruM=;
        b=Jgpd+3CJmRi7WWg+X9RMz6heJHP8+3wf9Z7wqGmztXQlwmKEMXh/GCdrS39xOjARKb
         GKTvEgOttRGrkEiW0+YQoECfmkZW+iSEBTG2ug20/RvjWLTj3nqaoNP7rVfBxrSq4Qd7
         jhxnf7EHeHDJyUVYEGh0oLeRD8BLIYclkCNTkWgphDX4tcu/HSVpWHfagwbZbrB7RN41
         IMef2fB7gX43e1Up8HCa4z8PNmcrRDj7TIByAtQDzfSEpg89xCc81fTHhoVeBMpbYOtF
         XpFLkxllJmHschDiFwmNqcgqr/LpmMcoK4mSwDSL//3kHNXErut9f1IuhR6Mzmd/cU+9
         km6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976679; x=1789581479;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dg+vOyYVeG/J+KZ5n/59eHOsMGy/Fco8k3zSySXeruM=;
        b=k2hT/Tr1vCSXXSJUEp5xR+FfhuK1/EqOY1G9wmEFYcWPGqwJXRxJQ0nur+PDNxEYpt
         NGhYaSRkUYuCxT6W6QoPn6MWSHpiG2OKtxuGUjP5snbzekx70bZr0TwnFiJoDCqxdPgz
         WF4fQg+oL4QpM+6OJ7GGfo/p24PUxY5Mib+HgFaUrpaZ50KNOkO6bfdRQpiYuZ6LbRZk
         voC2mxrXxtjslQi0JP4dI0bU9PtXilXKM1C44Jpm5LxDD2Mf95bjMWOVF/U4ftl1hz6h
         OpAI9Z+4UMIISnzwiUnd0JqiXEg8uJBiA3R6dSD2O2CNs2NyVv3AuQMAOFN6WrBoSM/t
         n/0g==
X-Gm-Message-State: AFuF++k+RyJTz21JwHM7S1jsQGPLm+wT2IoS6lD6hmttm/yHaP9o7jqW
	59HgAkcUb1qbUvCsqwPcRlEK4OmWJFcxHW9QfoHVEeHMUAweO5pZPyoOWevHDhz1njMAYitAcql
	HD7A7Kukud6PNCTvMs1sK1NG9P7nWEld5dht3tOn3zNjQkJfYOf5ZSB3SKv5rh21E
X-Gm-Gg: AYBFou13YGo8yP8JxnPh5MyZkICGnLkGXMJmW83amMD4SBjpFzEl5CLwAj/WhOxxVE5
	rECbCP5rlDBhLCueCMlPsDAWo2+XUWhMGooG2vvhpESB4t9SV9mesci3SWX66XHUDjbU6ZanhK5
	phTvk1RbK8Mpl7IUeg9CGqhvxnqnD+q87wPhloPd1Lxhev8hbEaejmYSbVwU5A6IKI+x9iju6hs
	u4YoomZid8aYz2rkrJUZZb0kGRIZmPIAX+WgMW5HxerPCCHRbfbbCQjp7SNlsYTP23bmT8m5s2y
	D021b1ybnL8pRUKeo60qz4WZZrSnvC3SG8q4dFP748X69h6QF0l9v0BTZmB0mgnALBAl0n+DO93
	bilW5uiUes9WmXOCOhkaYsrNkcAQCkJGHtfX1T626u8UpjM4xxuk7y4s=
X-Received: by 2002:a05:6a20:2d22:b0:3d0:f57d:c87a with SMTP id adf61e73a8af0-3dabab860f3mr13078850637.0.1788976678898;
        Wed, 09 Sep 2026 10:57:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d22:b0:3d0:f57d:c87a with SMTP id adf61e73a8af0-3dabab860f3mr13078801637.0.1788976678484;
        Wed, 09 Sep 2026 10:57:58 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
In-Reply-To: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: Fix IRQ cleanup on PCI
 IRQ configuration failure
Message-Id: <178897667494.2048605.9304437211489801497.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa19e27 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JJR71pI42961Z5K6J_YA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX0RnHPi04jTnb
 yoIrev8t/LVzvwmpV+xD9OdXvSCRpuYxwACGiHVfbZAKkFwu4WdIgtLgFoNs4RrXUiz3f7pEPd9
 9tB+Yof9H3L28vvb9uf3R4vn92zRFV8n8aM0Dct6K5zCEgmhsbtFARDAZ0LzfQBBYpIqJaUWHH7
 or+SrknweomAwbDkptSLT3EWUQOCFPCrGSXPaxKMjXtW5UhBTXpdIEYcORX4mz4akgXTX0VFJYJ
 qTBUkZHf/X3rq6O51knsLkwErz4+1dTPPQhtbEnFgJtb4BhcTB0e3UjpVmNgtSWhY+/vhZED8zT
 Ar2ILtqopWHx6JLJ+LTPhZo9wHL0YIfXHit1yVlO1HBWNMXPzfBfZq5dUiMr7qCyhuTDl5HXKB0
 hKapjEDq1dkWzm9SLSl+82tIgsspszLYzT4qhHk0q2xcgozg9tM/ihEkY+L8fE5/VZJ09KdnZ/2
 HWY2ac7l6IILKywO9KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX0zdFD2y3QLV4
 1gGW4SbitNJHxQo0V0novoF672vgPh97xwm1miYAXWGGf4lmGcRmdwGFeJHRxxthela5lm0kXaC
 E+i62lvCpPktfCZL685qdLj7Bx/JWDA=
X-Proofpoint-ORIG-GUID: QB8LOxrgCVGVnR0_JOPohdxlHke8E_3Y
X-Proofpoint-GUID: QB8LOxrgCVGVnR0_JOPohdxlHke8E_3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105800_058703_AFCAC8BE 
X-CRM114-Status: UNSURE (   8.71  )
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


On Wed, 19 Aug 2026 16:32:13 +0530, Aaradhana Sahu wrote:
> Free partially allocated IRQ resources when PCI IRQ configuration fails.
> 
> The first patch frees previously requested CE IRQs if CE IRQ configuration
> fails.
> 
> The second patch frees previously requested external IRQs, stores the IRQ
> number only after request_irq() succeeds, and cleans up allocated
> resources on failure.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Free allocated CE IRQs on request_irq() failure
      commit: 12ca935af2e68447e9218a615ebbb5ff7faf1554
[2/2] wifi: ath12k: Free allocated external IRQs on request_irq() failure
      commit: 9a78703ec4a895bd2e99bf43bd18d76683126c19

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


