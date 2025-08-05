Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAD7C87FCB
	for <ath12k@archiver.kernel.org>; Tue,  5 Aug 2025 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8GWTLsDapJ06m9sj6GKQ34d0P33lgkh1NvaX1OZEs4=; b=nqJfeucyp8DFj2Magvq5kAkg2n
	1HHXsZCIcGX5u/EKZ0RM9JgpVyJu9OYKplqE6rFeGjqstI3BKnXry0yTBAtPBKvTaeAkDztvixYXY
	Iq/HwmVU5dE6HyTZMC9tscZj0tuGOgdcQip4KKGdODl+8qzafwmeB8U3cQCflIwBkUWctazHW8rTQ
	fctLBTxWJbEYUu59nnu1mnYX1Emw6G8uApvhIuXBbTd7pbZ/oM8wx5Co60122wqI06hQEFkNiIftQ
	obTAWRBSwcnqCbwFdgKUF69vCuvJS8gZbzcInGA3VRph6O0Zo/xMkIuW7aQNGQjdjneoVEE9vaMZG
	2InNxxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJf9-0000000D9Hh-45aQ;
	Tue, 05 Aug 2025 15:33:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujII4-0000000CwOp-2gd8
	for ath12k@lists.infradead.org;
	Tue, 05 Aug 2025 14:05:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5757OJ7P004224
	for <ath12k@lists.infradead.org>; Tue, 5 Aug 2025 14:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y8GWTLsDapJ06m9sj6GKQ34d
	0P33lgkh1NvaX1OZEs4=; b=jAIMma6CYw3JK3nfFf0Da2hkIb7nPW1Jh4bDgmtD
	5iw1pkAPLrNmwsi+f6MHzF+yZXpcqvNA+nivsWmTgTGBYZsyFEGHnZ6Z0C5WgLKo
	+UrsaTVsR3Hc2lBXoCXlKiULAlsfBm+nhYZSLvLhM1MECxBSCQIzQYtwqEhwEkkm
	SUHpQ9vVYlxAcPlFzel/7M8ThaizvIwdTPXXqqsufHLPnMeTT1EilxP+W6ZJKsHc
	C5z7N2AdRpr1WurFIipApsqpmD7uelP8DxdCKqXMZ8N9XgDUpIs4ptV4JDZ+vh3u
	eD4BQr9Qvh4D+WvpvJMBklk1m668AibdG7HQg3pQ7LjOIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3tm9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 Aug 2025 14:05:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3215b3229c7so614808a91.2
        for <ath12k@lists.infradead.org>; Tue, 05 Aug 2025 07:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402716; x=1755007516;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8GWTLsDapJ06m9sj6GKQ34d0P33lgkh1NvaX1OZEs4=;
        b=RSWldpXzUIXsdJY4/Sl2h8sFT3yHLFbgUF5aN8HSh5aNT0dMa43t3FmufWI+DQFgzd
         c8Dwtu4ABPa0fH+pSYxkmOlkOX6YiqaQEUFc0zVMz2wFrZqcNF1cI3HMxr2zI80WeOhZ
         Rk75KWfi/qEp3wbNZ6l/W3ck+ofJxSzoZttKBzZpQheT9lEeH5i/umBdJF6j4IUg6uoQ
         oB96BJa4/v9wqbF4TGttiaG1CBAcGCtnYX+EnnRZ+f7cqPbSkFei+EVBkBuk0YPRNa/U
         /BAWuBPrXh2Eo0l1JgyLqN6WslXTLcbopGeQ9MWGglSOC2Fa7zHp0f2ZDaW+pwOgx6op
         OhcA==
X-Forwarded-Encrypted: i=1; AJvYcCWYkfoVqRqmWxCiPE54FVbFOR7frdGjeQivNll+R5YsBzVArevGaNsT3AmnYuU7voD2dc52QcI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXPHv1J/JAbUljRNm16Usk8NTyG74z/vthUg65Z2P1QCyZtT9l
	i1BeZn7UbSgsnPfICZbrXtqvNII/Kl7Uu0w3xWVsrimeQL/rbEC1szqtAjxVVYr0M3kxDzBg0Lg
	Bih40GncjJEBr2H0Wjk8JSyRS+0gcPXeW710VvbWv0aBE2d+F8301MDb6/NxGktug
X-Gm-Gg: ASbGncuOKEZd8pAGxUPx2sAlzftBtY+RY/i9Bvuv8P+LE71F56aUYPi95Ss7MByewbY
	5/wLY4zcE6qX7qx1aMkD8IHFrxwmKfE7G7x1pOdESKSKZ0t3YNEvUy8HFI8IrkiS9JTrSCOkVvE
	pgDEokbhuihZnrT+wv/vUnyjSdBLWOiBqpJ/H2kvdNHzWvyzly2uM4T05zNmjJuz9j2YJ2AAY45
	3Kc7a0fyCQSkjzC6/FI2Nrk22e9M2vUtYG5zZuD8IT+AkG07xNN3DQYrHmPC2lJ03XSlk8+A3vO
	hsLHmwv3aHMWm4S2sJcpnRgdasnGTZX4JvWPVE8J6tWru1tYP3WpvQPOXWMU6dgKkHc=
X-Received: by 2002:a17:90b:3e8a:b0:321:3715:993 with SMTP id 98e67ed59e1d1-32137150ad5mr11688562a91.14.1754402715841;
        Tue, 05 Aug 2025 07:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjmfwajEFNC0n/4JWnoR261FA5nFMX6Yqgmg9OjOOyA6BAlGJkbJzfB308KbNyUV9w099bVQ==
X-Received: by 2002:a17:90b:3e8a:b0:321:3715:993 with SMTP id 98e67ed59e1d1-32137150ad5mr11688449a91.14.1754402714757;
        Tue, 05 Aug 2025 07:05:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d846esm369077a91.8.2025.08.05.07.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:05:13 -0700 (PDT)
Date: Tue, 5 Aug 2025 19:35:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <20250805140506.b6d2x5berkss3it3@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
 <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
X-Proofpoint-GUID: KNAzxLZ44Hy84NsjTX3eZxreVS2d5ZmK
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=68920f9d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9ZXyijcKk7BvzWFVFWYA:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwMiBTYWx0ZWRfXxccZskvRpytV
 GrJjh8fB6msIYPf7bcWH7tGXRyKKNhHSZYZleZjbgH81LhBPJjzvUZFUMxABzPAJW+OqhfGNHyv
 D7NlDH3xt/jhuMeZhdLbQuOjxqPlwMu1Q69fCsXQVpTVImAlJzH6INEFUDTZmJdVETMOucksCkH
 721Q0NLUYiV6bs1ArPdIbpjpc+se/RPbvNBObsledTm4xSxXs1XS/26N08LPsPtAwHCnqjnxT7x
 P3AgmGYKDW/u+cNxReSBLs+2k+ENyOEJDA0IRT2/IdcaRTzl0IG4v09gCGkjkbt7D3T2GNH8T/X
 xtOjr5rIVX2FkYx2NEtiyQGqgQkUsCipY9Gr97dYuZ+XxNfvdBzOvwGse4+o2zjF15iXraDL3pQ
 QZAnbIXMOti9vEJfPvHo65E130NujA5vaWic4zzb6pDU2VA0UtvGPya4+0eU0+P+ZJka46xn
X-Proofpoint-ORIG-GUID: KNAzxLZ44Hy84NsjTX3eZxreVS2d5ZmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=929
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_070520_824581_6D351F20 
X-CRM114-Status: GOOD (  20.09  )
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

On Mon, Aug 04, 2025 at 07:17:02AM -0700, Jeff Johnson wrote:
> On 8/4/2025 5:41 AM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/firmware.c |  4 ++--
> >  drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
> >  drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
> >  drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
> >  drivers/soc/qcom/mdt_loader.c                | 14 ++++++--------
> >  include/linux/soc/qcom/mdt_loader.h          |  7 +++----
> >  7 files changed, 17 insertions(+), 21 deletions(-)
> 
> Since this patch touches files which go through different maintainers, do you
> have a plan on how this will be merged?

I am hoping,  Bjorn should be ok to take this into his tree ?

> 
> I can ack the drivers/net/wireless/ath change once I know how it will be handled.

Going to send v2, please ack it, once we have confirmation on the above
question.

-Mukesh

> 
> /jeff

