Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5BCFCC9A6
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 00:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=; b=vf2TdEjycNuuA+rpQSvhK4Vl3K
	jMSvSzqpLcBoBbkkJ/21e0F4hQ0ZR3HApD+aCciMC/bAg7s/8AwrlVVe5kBjCTjJ6yyvqFH9QpEZ+
	JF/J2wu67OuilCcZsrCwZyGaN4OaVIypWLiKNjQ1b/pgaP3FhbStZ0hUhCWitg0rfmjf5YB3KK7uQ
	HYfP3PF3iISIclOSwZ81yTKd7OuQP062Q/Zk+9t+D+idZAGLPEKTkw10aHCfjagHvO3UQpTO3JPI/
	nGzTZTOI6jNVWu3YP0tFipbCq836Gmd4hbbaCNWQ1FuC0Zv97Apa1ZpfS0Iox2+nuUF6RAJgD3Wx5
	8xBax6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzka8-00000008MYK-319j;
	Tue, 10 Mar 2026 00:04:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzka5-00000008MWk-1wbX
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 00:04:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCBlH3149075
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDBB6MSWvIU+uCb142BM52FL
	425T3hgvc07Yy4sfD2U=; b=nZkP6IpYkgOyZjCtuUwwRI/ObSj6aw7Irq10/R97
	PPiuu9fKLJwceK/Xpa/ltlNYRujyeGcThKXjnd1ZPj5BOWnCNOnOT+tuwIqX/9kg
	KPHv56GsLwKOToA1ScWSDHUqqWofqSFma5li/xOf+VFsbJXzKPscn2meX2n5aZsf
	XtSa6ak0iWjrflH7/qf8aiyE2D1I5OaO4RYJrfzuX/e3VtNDkNowVusVOqEC87Nz
	wJ5TX8ER5EDtnxm7bXTGnP6qHbg93W0JM7UpnEpZ2OW0EXBM4a3Wqe4flApHSn5I
	uOLdhni2r/07ThP2hR/CEJLCeB4ZAOY0/M80kRu9WTivcw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5uah79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81be6f05so1122701385a.2
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 17:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101052; x=1773705852; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=;
        b=K3x8qO15khV7/+sEPJutBCcSjLc1/ICay0oYxFYnPlkiVopGzMXhbocsG56CPv/ZWt
         FpeHVekUgPxgoiKb6ivceCzg6hN/LzjUx/z09RBbqOPKXZGq/PEgDNV6pUGSCbFzniEr
         rom5qKpYyff/kRZ7o9u4xrjarmIhoTaRJEPwgoFEh41SIG8+HqvhiIeCTRaEPHha+mu0
         +N6rgFrU+lf9FttB7RM/DsT/BR1xikh9wOoEV5xzbG4WX1EJ3i/pAc6fVVRNkuCuTpWF
         rbdFYGswxFSkyqHQ3dOiRZ6BR16q7sY3pXLZzLJCLUMgqjLjfZtSHsA1OV7GiaF+JCQe
         tDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101052; x=1773705852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=;
        b=RVflE2fkn6vbqskY/JuAcdFyfCcTeZViX7RJFWjrAxn4nTjhvlMkkE3xEGmdxG85f6
         eyu2uPzkwmDK3DBiu4iE/cAJT2VedFfVr2FjKh+tWh/9CBNEbx+xTaYo/rGXFcukJ3XL
         h9306h3aa5B+PN/GM7jHZQjuAHkd9NLqu+ma87isD0k5fQigxLKcevXIH5jSwZh9KzGi
         3gX1EOpInGBtRqmkC1yuLGFsGEVp1bzGHU5Nf0Binq5Z7GvkRK9hltXkwz3wfMbEzfo1
         NidOkG2tMgtWLF4wEG/rVbGf42D3Qrv5aScOe5T7kpfH5mFJKlyCCweW4ij9j81G/qG1
         HmXw==
X-Forwarded-Encrypted: i=1; AJvYcCVEe2AQcgsldRi4ZFiPK51+KWAC2PyS8UXhHpB2gjy5EaGL5jegwjW8EvyaHjRm5gfaenuHwXI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEBu2skq7eFm5kpDkvSscvOn0P/uV79TayXyJAVfZEE724uQ0N
	5FtYQKtceyVnN9iu3juIIOKtpb2TK27GIzxbF8rc2m14+cUCUz3tfd+WMipV1D7J4GrgMAq79oJ
	OUVXD6ddhb0B9Rpos4NDcTV/gBkD2CVoGMwtE38lCEppLqzTRpyjzkrAia4GNdkRI
X-Gm-Gg: ATEYQzyV2DnFUt5ktY1OHRBBtVVuf0A6JyYEmIts0CJvKi5Oon1fi30AOxva2QltAgp
	FEfoioG/Upjq87zTB6rHNlZAgnOS/UJNg8Om3daLO+wSNGozXfoSxpMkVFBa7ECOT/ncBGV1p8y
	pTE+IfPqEvDpHxLjfKRY3iTm486YcGNC7d475zMKxvnAP4SMArCqq3PXwDBqkLn6aeR4yIwKx1w
	ob8YTKM5eDA1/uXzu6lsD3g0+D/ojxnuZLMDx4smTkv9BStwBmb9Cl1Bu8/ECswQRFYNY0Zs8TP
	mPt+G2H5YTovINCixQ81PBz9wrGXArfjtmaEgrdMgPa2Dq1fEqOdQzZ0PhTc1Dd2EbSRSmzcVlZ
	jl1Q8lqqV7tGuQp3H1LUZkDgAFIxuxVXuJi/MqVHEw+Q1xcy5TxcEL9wfKNkmqmB06fgRe2uRe4
	ikrN+ZH/6LZcKj0e80uluMqnhfHie9qm+UKh4=
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1634215185a.70.1773101051664;
        Mon, 09 Mar 2026 17:04:11 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1634211085a.70.1773101051178;
        Mon, 09 Mar 2026 17:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d085ee3sm2378748e87.62.2026.03.09.17.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:04:10 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:04:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
Message-ID: <3yzmnaovl5dwhxc7r5dr4pjrvcqpmlec5vrlzhnj2cnpobqpq5@uvfiuyakrg6b>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-GUID: Z-JReM2vh0fBsXWTOyIk5NDQyMzr-Utb
X-Proofpoint-ORIG-GUID: Z-JReM2vh0fBsXWTOyIk5NDQyMzr-Utb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX4MUZpsh01x2p
 I7SvoBxKNzVN24q68DAxDsLr/7BWzpjVaJhYpVH3w3p8adP2eCyBWMXOAj/ISU0tII90OlX7QCx
 YvZdS0fpjuoNSzELbZO5ifDU8AZbKW0jlPd9KU2gJ86F7HFwqq5nm2H8+C6qvWmQPSiog6ai/gT
 GcUdM2ULU4LLYI4X2o5km1yMy4/9KiUJ1Ukj42Ezs07N2oJoOB8qE6LM8WoLgyiL+GwcOvq3MS1
 NM/y2EVv8uipT00cLnuZdR4Dj3tbVJIlYTTDPHXPjfJAouSRrxhGgWJeQFQJdjPM7ZXZAABGBeS
 sQr7Zn2XJhyEqfXQXbrtJr2R52+e7d5Q/kRnPQevzIgdccTdnWe6Cj06FX52+gw8jTZaw+g1bHm
 tB4J/a41PzbKscmWPiaMYKIHEjwB2WclX7sLHq+7zleo8xF6w0I7U60cKBqZduTrSUnpWVWthge
 auGPrEALP85gEkAFxpg==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af5ffc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cjxZHsy2hmLZGnxokmcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_170413_609693_C0E11DFE 
X-CRM114-Status: GOOD (  19.71  )
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

On Tue, Mar 10, 2026 at 12:03:30AM +0100, Daniel Lezcano wrote:
> The QMI framework proposes a set of services which are defined by an
> integer identifier. The different QMI client lookup for the services
> via this identifier. Moreover, the function qmi_add_lookup() and
> qmi_add_server() must match the service ID but the code in different
> places set the same value but with a different macro name. These
> macros are spreaded across the different subsystems implementing the
> protocols associated with a service. It would make more sense to
> define them in the QMI header for the sake of consistency and clarity.
> 
> This change use an unified naming for the services and enumerate the

Nit: see Documentation/process/submitting-patches.rst, "This patch"

Other than that,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ones implemented in the Linux kernel. More services can come later and
> put the service ID in this same header.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry

