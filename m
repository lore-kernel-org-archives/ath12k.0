Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAEACA0EC0
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srJNkV8mi/T3+DZb93ch2hkKPbbG674MuA3RGQ20bB0=; b=cJj9W9gD5qwHyuNMGHF48qg10p
	JL+GuT8ESly9/y2YrEeyUtsdKWEvyZVk1V0kAb7ijfiXAQhqCbIimtxc+1dxR/IOupVU4FRwiRyOk
	aBcHoK6PJhWhG5ugQo4K/93MWe5JGNhvftL6XnqHkvl+PUDDUCpwaHC+8u9F9+bqxgEWrMP4M5XtO
	RwO5pQsRrNPdKJVizEYZnHOABYC298sq+j8VAF87PBiIDUmaeKDolXnRbxTKC58fvEuxK6S9vFcGZ
	5kyQnS6lUg53t2pZJOobyUx8HzUSGdSq5VurIOA+YPcQTjvrZmFizzNj8JQ0Nwz989fXrGKJZtN+h
	UJcNCa0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuu0-0000000AU24-0SXr;
	Mon, 04 Aug 2025 13:06:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiua4-0000000APu4-2DFJ
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 12:46:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5749Z58Z000546
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=srJNkV8mi/T3+DZb93ch2hkK
	PbbG674MuA3RGQ20bB0=; b=McHctA66Bgs8D1rMerh7ta8TOsGMjNF74+GhUZNB
	iRmxL6EhwTlWsCSPQtSTe1PZ09+aV6cXYwFuO6s042TBIpTDdiIcwzK1n7oRxaPq
	p+TibN0ZEzGUfDJLtFM6D0D2ZTbaA6ycMyK8cr65uYDsgrDfSeEZzQNnJFpHk4zR
	Ms/mccru8rJ0kBSOeL7qxXQvn2JL9YB+ZWsx9bTGoMwfCN3pR8tSrK25VTsdF/oT
	ArUBgWyBDxa7GkqfNNh1fKTINPKXnVYNGFztFVEVHAnduCmPMgYP5hIVSvSrr08u
	RBckhVA020jcfoMSlC3wcGHGK80QlmraG5Ok9efCUqiqXA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a4w1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 12:46:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76c0039e0f6so1267736b3a.2
        for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 05:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311578; x=1754916378;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srJNkV8mi/T3+DZb93ch2hkKPbbG674MuA3RGQ20bB0=;
        b=Hh/Gj5ttEhigdb5TTGZtsrLyqscM150FlcaROHOgUg6aQ1uNtJ/gyYNJfQxBJHT3q/
         3ibV2baIqUzGKoGTZJNFmgv6XgEel9LqazMTEzznFMKqlHushVBasLa23d4tMdlHr5oc
         0v95gEjEsRFDW44PlnNrFCWAUM+xWpAQvGdNKkV/kWb3xMlOTs8od6TKTWXcrfZyQrJI
         emGpSXFFeE/FoyDoLmBVxze4yHM/0H0Ed6tCsFP+3KxkTYWiHbC6Nu9RFtwFNqCJrmcP
         ihPRJL45DyS6Tw23PVqDeYva7uNSM7j+/cpyzrZArTih/dTPsDu454SLIm35t5h+GtV/
         +A6A==
X-Forwarded-Encrypted: i=1; AJvYcCX5MiD2iB9IW7/tWSa3sfwg4NYpjfiUGWjWozZuAciiZ2M63+2t1mnei9lw7DI02N0YT7BirWQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4I/OPw6paOGll8WySYV5zWDfgex7ke30u77pFy8w0tzCzlSsd
	QfDjPmmx0IjmH75shKWFy4Mu1YBKUml7OMOepzzs76RMXGFdnu3MWUvGYkU/ZCNTYPSsQELvxu4
	fi6H/If8Gqw8ztasO+OpF8vHGm+a2CJIBE1aglB2cPgaTb2maOeqcmxiYumzQA+bX
X-Gm-Gg: ASbGncsndKmlx3BBtU4mmg/EiEcg+LBJ/RNWA6A8lB2cQ/e9hceO+HohkzF24TXAHjO
	gs70ApXzDVdMeAhoBojzmTCRUchs91GMb6D/lutp7ugFZTpy/NFPiS4XPIWR5cey++Z9pu8yQy3
	/zFZfWqGpPd/Ez0ErZDW925CHcIebOr1zuxZrViF0N15k/NJza41ZfPDHoGe7cSjAKvqrGnRJGc
	83WLb0/5JfiHoSnb3mQNjftq+mGxdzhGyw5GfK3dsXqthgvlZcjOCOaQnWc3oOCNZVbj8w+Chi5
	FgQp6UOFK3dAxKBGrS4+0ZY/2qClRl9jfO5BcTMaL5vuaH1fyXggP/9Jb3jaxoYNt/o=
X-Received: by 2002:a05:6a00:1484:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-76bec4e1e63mr11958376b3a.18.1754311578253;
        Mon, 04 Aug 2025 05:46:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpdaJQ7fVIlE18tUxW2ATQbF3hPhP2gMHXpqf5ai2xxiI+sZ1i3HhvTdj4U6zAvu2H9FbzRw==
X-Received: by 2002:a05:6a00:1484:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-76bec4e1e63mr11958312b3a.18.1754311577464;
        Mon, 04 Aug 2025 05:46:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8b5basm10399198b3a.41.2025.08.04.05.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:46:17 -0700 (PDT)
Date: Mon, 4 Aug 2025 18:16:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] EDITME: cover title for mdtloader-changes
Message-ID: <20250804124610.xqioktl6lbyvv5qb@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bjorn Andersson <andersson@kernel.org>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=6890ab9b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ICuFGErgaGyLqr7TlXEA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: cFgQpUloLyjz7T8YzUALejcguFT42q-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OCBTYWx0ZWRfX3MXiMCLbHy20
 A5oOYOUMFGmS/AosrUaogIRb50DidW0s0YBaW6A5s5npG1xG44HATJWdLnERyaq8b8hhxSyXK2k
 JkP1lr0gBGDst7VR+UAXUv3zjskIz8uTVOxsY4BBMxzAVnQZlMthkG1y6zLXNjRsj10D2MHmYbY
 25vp5w7Sk5GRq2bJPZEvBs2V50/lhC9sLZKi7DSTqyJqzrqKbrdmP2qbULxiKjeuQSJaWDk5Y5h
 0cz+KBo/tgk2kBB+aiSoTv2ifIht6+2vWlpBnfu+Z11DqewNBHHKcYjMCC4+TItroIqXIkFS4TB
 SiSjRX6F8qxDQRaCEsvTVx8sGHIG838ynmQ3DfnfDFAOGCN2SiXo9PiYRECPRBJdPC/pHHC8oA2
 LtXSP7Y3JdHReu/CxcBUDnEdscbL3OSyRpb/xyqs/HLha3dwjDFnRRWyECaUEen1gcZrDLmo
X-Proofpoint-GUID: cFgQpUloLyjz7T8YzUALejcguFT42q-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=976 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_054620_680765_048310E9 
X-CRM114-Status: GOOD (  13.65  )
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
 
Please ignore this mistake of sending empty cover-letter to your inbox.

-Mukesh

> ---
> Mukesh Ojha (3):
>       soc: qcom: mdt_loader: Remove unused parameter
>       soc: qcom: mdt_loader: Remove pas id parameter
>       soc: qcom: mdt_loader: Fix check mdt_header_valid()
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

