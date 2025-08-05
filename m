Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC15C87FD1
	for <ath12k@archiver.kernel.org>; Tue,  5 Aug 2025 05:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DQgWHooGYbmL/nzLf5H34thSEgDO1zfXiTjKuJ41Is=; b=PZwCHzAWgIuniraN29cNUy6xJv
	X4sQpDc07VZ1TXummqSwH9NmR13QZ66YkbwvDSzSmNuVQDvip687KbyHiVE2fqN8iVvW+l+3wGmSJ
	XZcwwKuoMg7CzbYp1qKyRIAlgYZ96GEJ2uGDZj+81goicD9elwpNKLFgQ1NtELmEdqpp6tuA36WFX
	aEHpE6CbgYPW9UOC8IBzikuQCwz13I+xE0bj0a1nbeu6il4iFsJYcOuSR4eylie6uhRT+RUhrq8z7
	hTMyIwBn+EJSYXIoqyrFmh3zzVkqB18hfcVHgsdRXSSD5Xr7AWLzu+Nynv/HT7tqoQEbFSqfNuVuS
	EyAGa3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9my-0000000Bmqu-3mOZ;
	Tue, 05 Aug 2025 05:00:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9mw-0000000Bmq7-2Szs
	for ath12k@lists.infradead.org;
	Tue, 05 Aug 2025 05:00:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574GUsKT001753
	for <ath12k@lists.infradead.org>; Tue, 5 Aug 2025 05:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0DQgWHooGYbmL/nzLf5H34th
	SEgDO1zfXiTjKuJ41Is=; b=P1VWjBLHIfR1XVuzIzFFwTGt+j4gy0b1caNJDDLJ
	SbTeKxBirtQi3WbViE/SLMPz8qOiU3sW/FxOkW1oaMxqKGEHGguIEPfI38VC94vd
	U/uM9xaPJkrX/ssrML8soZE8NlQlF6kWqZQkZq8HVBSBA52Z2HuallGAHpVuCs6v
	of5f2/zji9mf3K4T7xT2x4hvZP/5TcVeQoPAFEy6rRWuShEE6gR6Bq8Rf9JF2Awr
	xib4dNf9UdYgPT/8tsT0f0knAW3IhEf5GSNtaxWKJnr8Uzyo3HN/FerucZkbS3Ts
	NGPmY9cnNCz6Hc8K/nejkdxPC2DeQu+KoRuuj6eh8Kyn5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc75wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 Aug 2025 05:00:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b08431923dso6945341cf.0
        for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 22:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754370036; x=1754974836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DQgWHooGYbmL/nzLf5H34thSEgDO1zfXiTjKuJ41Is=;
        b=Iuhk0ieIAnSDRc362zPvUjllnt5ygyLS2dFGMzYnmJGxHf+sLhcTcbSRth5pvHfDaY
         CT3nPjpvEJmIevvRdjSuw7VoTWFJ507Xdwa9lcXOXQBbzG0I5zOJy3rwkxNeH/DtdE0T
         lAzTx84XHEm56CyTTwYq+T6vtznJnBu2mvaJPPmcqGrh0nu0hSC5TfYIstxD5sBcQ8ce
         df26pJvIDY91PJjRBFGH85DJWroE6KKC8Ehl3wo58UqD2Jtv9VawynXg31vRQTi8bW8W
         2gItGamkQxrrHQsgB+feGp7L8keJA67SpA53pObrE5ne6g2Nv66RZBmNtbWE/FtqLARX
         QTUA==
X-Forwarded-Encrypted: i=1; AJvYcCU7rcOD66SVcm8tdfnsH5gq/CoTv6aKRVw3t4+UK58N83hmBcmXi45Xr06Pc4Qw3Kb0Ls2q9yk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqgwbvfh4zRFE9bOCpvfbGzNaS9b6eDpAzf0d9qZPKlLfiROY1
	iF3SQUZT6D4eiZxt6Xksocq4JEFuErO0x5AFHisShcoie2t97ULv3MAJ/dhwahdieRTItaP9W2j
	NsiZKPwgbNlC1U5GV2a6KTg9dZFpj9FcpUOBnPVWD9aD9dwTCh0TBmOilRjty7nRp
X-Gm-Gg: ASbGncs1M5U+UjhCXMTgV0NEL5WH5SxtNA2Z/7+07tD4vTi465bYaZJEiO4CmuDwdx/
	GL52cDTo7LqBCtE1xXqYGrl3J5JUQquvOp0vxb1txDge/LeKErYzqlzQ+rolXGP5WcMyfzkmDGf
	rVx+W8MZ9fTEXwBJzvEINhOxLW73VmskI6HT1WlVrUmWC09FkP3bX0ljWZ4EbhzTOimP6cFbj8L
	nmXW4mbNc0367ICvPGwnzMcpYPtLVm/s2jf09bxLF5nk3Ko1GhC1Vd4VYGMfNf549/J0FHwXbmu
	FNyGxGw4ll/8WyzXtItF2a/Sbxrf+/gGd/ccmDwpXovb9eonuuRJzBGa5R4IwOpo/eAKnj6iF5J
	zqCV5b18RjHmX4T0DSJBxd27SLanK4DKsFX5o5Cm7d38SK/sJCBNg
X-Received: by 2002:ac8:5d91:0:b0:4ab:41a7:852 with SMTP id d75a77b69052e-4af109debe6mr149518801cf.26.1754370036477;
        Mon, 04 Aug 2025 22:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqMH2QSkqbkzukFuo9DOhQUO27ugkh1JfZWpneNwe/H+GAHQGLPuQ4NvXpMhqsRUKDJMMqTQ==
X-Received: by 2002:ac8:5d91:0:b0:4ab:41a7:852 with SMTP id d75a77b69052e-4af109debe6mr149518421cf.26.1754370036093;
        Mon, 04 Aug 2025 22:00:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a3243sm1873486e87.55.2025.08.04.22.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:00:34 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:00:31 +0300
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
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Fix check mdt_header_valid()
Message-ID: <wqfapilh4mydzkabt6rvkuwtjoii6wtfhm4jzo7h55cie6ivbo@ytt4xo5l7cwf>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sTOXFbly57o6zH4-czjW5-EW5vBBLamJ
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=68918ff5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=yAIwcYGD20Z8B-JgagEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sTOXFbly57o6zH4-czjW5-EW5vBBLamJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNCBTYWx0ZWRfXwATbcI7HG+11
 g3oEBJX72cmEjFERqYrIySZ8y+vtK+yPqvT/YaCKNb58q3CJFc6Fwvi8kwyAebxlLk1c5/3Y4R+
 GfkNkABttPIbCXjvJ0+t4NnsSDhYrCKs+7OZTeNHt0/jVGnPdCTR/cK+j8sBqbe+uS62Jsm2MQ/
 hd8FlN0KTeByghaUVm/dFfzuHpDwl4wMFGUfKwWTPpmYc4xvOqroZ2+L3hi5AO7lQk+bWRfp6gn
 FzAsP5BerxIfKD0hEjsRY1zyJrbX2XOV/3Sp5oztKJub8N/+8K0nBny/+pVFL71XDoThDQrGhtk
 cHuk64gWrNJ75d1CwocFXljCJGMkQA0h8jmINPvFkBm7i8kBLQqsHbiUZYp7tMaT+dh7DrAaF68
 2EYqGO/lY2LrgDPXKvaHzt1E2aki+suB683Z4Ilj8WXMWLM6+08hcsyqqqqM/HViFNOBejJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=875 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_220038_634465_57D29F43 
X-CRM114-Status: GOOD (  15.63  )
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

On Mon, Aug 04, 2025 at 06:11:51PM +0530, Mukesh Ojha wrote:
> Firmware binaries may lack section headers, in which case
> the e_shentsize field in the ELF header can be zero.
> 
> Update mdt_header_valid() to correctly handle this scenario
> by adjusting the validation logic accordingly.
> 
> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

