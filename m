Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6708C87FD1
	for <ath12k@archiver.kernel.org>; Tue,  5 Aug 2025 05:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9RIDmNzhmmHiightJnBZ7fI75tTgnPyBB5yU+qp9lE=; b=s1JzScfY+kvpfvCKk3347fLwM2
	QligPe/qDozjs604ccPEux5rGMQoOFz8dV0+Dk/MC70a4YdVfqfekBWCrFNl0hIJVE/O5FJ/mLAak
	SnmjP3zhFvbUETv/DePSzQlLZQV1TJcOwyw31QBsNLkeV6a7meXWSQR7PV/e/kzVGKSi4x4bgZybr
	a+nH/unvqXumJEVTH9UF3Lg8LBI//pCDpTBIbUFBkMjy8X9zuJ2rUW3BLP6i9fqmwXbRGVrrl0mo0
	aEf0Qfx494O9vQ0hL+/3wZIaY+Wm2c/OAJUWNvk+m1GDbqCiYhoUT3bJGww5COcaShIfHlhrd6a3w
	k+bKhZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9nj-0000000Bn0f-29wA;
	Tue, 05 Aug 2025 05:01:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9nh-0000000Bmzt-0BnK
	for ath12k@lists.infradead.org;
	Tue, 05 Aug 2025 05:01:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574KOtTm028377
	for <ath12k@lists.infradead.org>; Tue, 5 Aug 2025 05:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O9RIDmNzhmmHiightJnBZ7fI
	75tTgnPyBB5yU+qp9lE=; b=phwgjS5x5Wrbd34/c9mJy01NrjVqbLwhnwmEwR8g
	kmIYh0CMbdbF2yik0sk6V0uoFffk2oO6wzTBTF/zDSPH/bo9bk8pc3bLloIJblHh
	s+cOZyrn2cymDnmBApp7Hv/UfT7DRtnhn3Y6XhHlDcMU7i09iXIfh4ZRhCEKAx96
	sj4FWqJmAJsV1MF/65Ae/cI3cAbzQNjrvLOBST+uSmNE0euqXa0GzPEaLRmu4pgd
	IHMSWuSrrWJqszD6fC4AU3AlgynHgfClFVhWQGc4H2S4dkI3Th3PwVVmFE30m5+G
	9KZWFIzKYoSb0zctr+9QZgG5csaCR5xgHcmlZFVs4ubuEA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899paf7a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 Aug 2025 05:01:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4aeb8b6acd1so78065731cf.2
        for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 22:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754370083; x=1754974883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9RIDmNzhmmHiightJnBZ7fI75tTgnPyBB5yU+qp9lE=;
        b=EBDljUgfJB2Vdsfpq4jV+erWk3EGqdqhtH8QMZMs0PcfG2MCax4/Xrnga/E0QOYb/V
         9PmR6IKvIILqx+6H+An+h8MeFMO904aYeOxg0UCN2ETFdr3w49dHe9FhXhrUOPbSDJb4
         GzCHWFcfn7BAUxama7VakN5dBQYr29i28CQMMPrrhosKC62ssfKh+rZR8W3ZltDjSU7d
         dRMXb35bTLOUZVaHlc97XvbYnc+KAKc2hS/4/A0OyfqqrKieWyY9RxLzZTqqffgoRZ/+
         DjkHL0TF5JWbsbxBiENcBQr68iEnqL/gG0OF1Y6pz2wUemp6jImpKODH5BIAMYgv80cw
         jB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzzuqdRyXmDGzJrPGfVkSWBEove+R0l2V2ZpXpinZgOWOxg2gc462XIiKzehoVZ0Qu56jbIkQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0W9Dph04oP3Xoi5HCD4jRbnmea1taks/MJsf3aoXosW2y8Czp
	B3YzfQs8jQyNGPyE360elDsJr9dlOUG9o31ypjDP6I4fJdIDr3R5EFtRtwJkg9xIfbsb5aj8jTv
	ZSf5uHfQb5a4/f7egzBzWcfyEgwmUp1WU4il+RPjojd8IHAZl7kwWTwNUlidkAcFo
X-Gm-Gg: ASbGnctxzZ09Si58SOVvNFzN8FoLdc4rNXTogvo/AH1P3S99GEZW9oV1muExdTULE2T
	n4ZYisH/yCgLndw75r/Ikd0p4HsCdAfLRjrmZyXUG1NGGonGl+FZoiGUpnesqfDEK+uoeghcgdS
	sYncw8WwmerqYNwRx0HbrfWLW19CisqshOZuxS6QgmYtna1pUZbOXzZNMnebNIM2Uoul8wym0gR
	xqABUDDXW5lD4vaMNP+mGeEpjH00S5gsEL4tFfMnUZubnz+OT6zr46yiZIc2LDhRD+4b6CdTzf8
	t1u1b/6DUYkiLU/gCYrP+b3M5cfa+S5kmzzAD8ZC4AwyjMswR8COjSBlV+nCuyJrEbTjYAULnZc
	G8ve5axSu1z2dHymWAkzDJhPfLwwR2gMblxo8OhQJ/UbeWinFcMoD
X-Received: by 2002:a05:622a:2614:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4af10a4a6f8mr183536871cf.38.1754370082939;
        Mon, 04 Aug 2025 22:01:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFrkygcTlWMwxP/dXL1HWOn4RsCOYuS94xjX9GRmLBpCLWrY5VJAZwhtLhFsjZ3j/oj45ilQ==
X-Received: by 2002:a05:622a:2614:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4af10a4a6f8mr183536451cf.38.1754370082422;
        Mon, 04 Aug 2025 22:01:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332624953b1sm9339861fa.80.2025.08.04.22.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:01:21 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:01:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] EDITME: cover title for mdtloader-changes
Message-ID: <volasof2jfa5bv7f7epyetxgci6ymt64ampqf2hhqhjf7co4vo@afkw5oxoralp>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzMyBTYWx0ZWRfX7jANeldF2lV4
 uuwQnQXCI8kHauIrUFAXVwmSHhfYe5P+EVDe646VfPztMPnDYlfuiEwwmNEhHNOUvy+k/RW3XcE
 CJkFCdAscxpr+jMc9zX5Z+xD9xWhzMSu/6hHdmfAQmSbSnw9uUW9bxrpb4OiFGXwiQTQTR+TFeR
 H7y9Xcg03Z2b/GWuUl+w+hN9Gexp1NqbDV4dy6FEDHsH+kO77HzAUVzYzcui9EfWAHdmFrS7vBV
 wIFaI2T7VnuyneR1gGNCVZNB58txUvD73nEGMPCg1OXfLEHF6LC8VDnWf+9gN5on5QOTLLMNzeT
 hlL0kC7LlqRMs8Y4QkDtXUlk6DRvlX1r3c5Z4xSbKWaAgfwAdy0iW+LPeeOybPJ1UfBEdqdkuxr
 hj3lV9f1UqPUWvyp6gC48fEw/lAgAje8k+0I7hlGgSEYkrlATmZhRvJo3DxzMJJCrIrp+LUI
X-Proofpoint-GUID: p8LlTI4Ug_GqXeLYNx2XkyHnPTL52PW7
X-Authority-Analysis: v=2.4 cv=N88pF39B c=1 sm=1 tr=0 ts=68919023 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PPOPQqKM8dVImZj3vAoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: p8LlTI4Ug_GqXeLYNx2XkyHnPTL52PW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 mlxlogscore=883 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_220125_210751_493FA3F6 
X-CRM114-Status: GOOD (  15.52  )
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

On Mon, Aug 04, 2025 at 06:11:48PM +0530, Mukesh Ojha wrote:
> 
> ---
> Mukesh Ojha (3):
>       soc: qcom: mdt_loader: Remove unused parameter
>       soc: qcom: mdt_loader: Remove pas id parameter
>       soc: qcom: mdt_loader: Fix check mdt_header_valid()

For v2 please move the fix to the start of the series, so that it can be
picked up independently.

> 
>  drivers/media/platform/qcom/venus/firmware.c |  4 ++--
>  drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
>  drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
>  drivers/soc/qcom/mdt_loader.c                | 22 ++++++++++------------
>  include/linux/soc/qcom/mdt_loader.h          |  7 +++----
>  7 files changed, 21 insertions(+), 25 deletions(-)
> ---
> base-commit: 5c5a10f0be967a8950a2309ea965bae54251b50e
> change-id: 20250804-mdtloader-changes-9aca55e8cf37
> 
> Best regards,
> -- 
> Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

