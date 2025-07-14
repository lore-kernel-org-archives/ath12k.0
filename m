Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4D7C83F1A
	for <ath12k@archiver.kernel.org>; Mon, 14 Jul 2025 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jin39v5RU2OC6taZwVEep++H4MP+V5H7HkCH2SULjQw=; b=Js+8mk/d2DXm4PDgYhuyV3OvMA
	lIF4wgOtMgkUoq+MufxalBsXArRr8O/0Iu2M9HVKCCqtaR+K8qle26RILq8U4id/nALg26gaOStl/
	4oyTF+pVmTYKjpw6Asy5w60IcSuBOBwrth5uv34LmlhIO20tD42GH0VMgS0v91xfCX4JUGbVOloUD
	H9qKmnoRcbmRlEhGZV1qhXm6SNFhb31q4lObMgj81ClaHQu9RVdoaRfQAfN8NxkSlMy2YnBWyGgCN
	AmlSw5ntLl/Rn0xlAt8CYeEHsOqi3ZaviQkepujBU80YUhBmYoWkNm+ODyb+Ijor13F80MZ9pbH8G
	6cOp53ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubRk1-00000003Pu5-47EZ;
	Mon, 14 Jul 2025 22:33:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubRjy-00000003Ptd-3tRI
	for ath12k@lists.infradead.org;
	Mon, 14 Jul 2025 22:33:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGS9k2023283
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 22:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jin39v5RU2OC6taZwVEep++H4MP+V5H7HkCH2SULjQw=; b=cLnbG/TVb7wqSU9v
	zXIC8UP2dgJsrBQ/B49OUI5+PtwnNpBuqPs7LZhg2O42Jmd6A5PxQw/dh/SgKwIK
	EzxjQqEWQRmCdeUQFQHRPpkwOCxY4f4rXXUTe31S63/hhRRkKLWIKjFeAoW1IYUe
	VTohsGPvpiI51AuRT5/LwE4T/NbaSkfokgp8/Pgadh9/CNNOKetIbDQf7wWyq8Tu
	5phMJwzNcqPQV7F/zdmW7gUKxPcm9lXFrY0cB1IfKmQ/iOvEKpx1CnImyFgedVEU
	ONa83X4bOFlrR9FXvS9Xgr1nrLa9HgxCtFlv94cLsUbt14wEBqu0s9+Sqpdour2l
	pcPwew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dp8sqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 22:33:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7da0850c9e5so797692585a.0
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 15:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752532421; x=1753137221;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jin39v5RU2OC6taZwVEep++H4MP+V5H7HkCH2SULjQw=;
        b=k36oKALoPIYaDD/Of8ALD6cOv3E8rlGMpHuN3xRKiNJ2Cn6oyNsGboEWvpsZqRYPjw
         WEjJOSNbziXBVio+iCyE/DBZ/vj6XK8MjIAcnAFDWth5hO0L2h4m6wF9KYzaQw4fQrS5
         Q4LPPJA1fPhbA97bfbPy/hShbxX4flIfQjriyGBYvBXVI7IQzZabVUSx67jIY9oWuI1N
         SEnGmevbodoIemcdiWjLowRYv1kcVLNUX90lOCld9dJ9PIU2UTFRJc0y5pdqG/i0bZph
         I9+H+rvjYBmDRpMoSBw1Ls1jXdoL0rVvilNJUqLFFs09J4VBUoyYL7xdFkn+UV2/DNzT
         /e4g==
X-Forwarded-Encrypted: i=1; AJvYcCVmOxbtKV3d+zJaP6wAGP7WVsVPUDsNeu2gpzhzOuaPmVd2ZPIjQ3Irib8sM58invcPKQU3ZRk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbO/jfXK36OfvhZHyHTuoCVR3Xx0nQUG0oKmBms7GVruVALBjS
	Ghj2H+8q58KftMeWAh12+XykccBcJatkC+NahT+KiojoXE+zbsZjLMx+Ct71BpqkFuInaEtuJL7
	TDh+O45ze0L6SHUo989UqMuGdzOEJM2MjkojSWk322G5vCaOpMPFzCs1eTye3y5J4
X-Gm-Gg: ASbGnctg150WuwyJDFHrufHwcpAZTqX/7l7hM5M+vz9FtFRQa6aHAlkZ61OSuwrku/L
	v+bYR//rjY2+5K5vveg0yZj5z9empHfgCva5il93rNzF38b+ON8CMrR28n4ZM044hCNs0EWPxFq
	L5B6EpjKJMBE+NWEgCBECjSQM72oO89uGVAl0QTI6MCQtH2ddPSMNuzCOYKgVyX6dNwUuoaTzIV
	5X5brv2h+Ol0KzMuCXZAKlrzyKoimEyHym6TmXZRqLjkdpmSLBsRH4KxsExlR/zT/4UHdK87NTi
	S+CaeTEpewcpsrSE4r8y2Er3nVxh8D8VQfSvUIUj/uASEV1YBBAWeUiakZLJ3ZRsSS8F6CHQIUj
	KS5AAFIyTxbH49uNnch6cBjwakUpZ7Pf19RKebzMPOoZtlDD6L3ZH
X-Received: by 2002:a05:620a:472c:b0:7d7:891:83f with SMTP id af79cd13be357-7e338d264c6mr102022385a.50.1752532420658;
        Mon, 14 Jul 2025 15:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCqBgY+159Vec1cfE9dZ+u3XhxSpLqUZeIaerPTNko5JEPCLrdG5Wtqgg6IXPtXcsQrNQU6A==
X-Received: by 2002:a05:620a:472c:b0:7d7:891:83f with SMTP id af79cd13be357-7e338d264c6mr102017785a.50.1752532420066;
        Mon, 14 Jul 2025 15:33:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2930e70sm17078441fa.33.2025.07.14.15.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 15:33:39 -0700 (PDT)
Date: Tue, 15 Jul 2025 01:33:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9 RFC] dt-bindings: wireless: ath12k: Add
 disable-rfkill property
Message-ID: <prrra3lon2p4pugkgeytf5ow5wls62lfdnwcdykztw3qzwity2@d26aqh6wdyln>
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-8-daleyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250714173554.14223-8-daleyo@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE1NyBTYWx0ZWRfX5lX0UxrPieX3
 0c4rmhxX0ciWDClnJZN0blJwzT1Kd50A/PfTT2qq4fo8OWN6b/x+vnZYCzy++zBK6SGW+3PLKjF
 nGKISJFaapbk2MNghxG58Ik9S/3Nogv4L504vUGuobIeBdnOwxbNbgD60DVIQ9vldY8m9oI0Og6
 PdsZGWBLx+pYcJxFVOf9fH/vKuWWRpbKymHD4UAApiYEAHqNJ1FwdKG/SJA2WoN0XVlpDB90TnU
 LUuqCHHgHf0Xt53KyrjZehbV3ipcAuB+KvyOg6otdbDytcjKZTqjPgcY0LRXeBIDNTe4PhQ+059
 uXULWHSE0qkkBSrdYZRTy2qeAHQjlIxF3Jb82qvby/BdnI8SqcqIq32cl0QzA1Xqz7vor1sniGu
 0Bxei22gM3XlEH/xhohSNao/7+3zVL5LSCS/jJBo0i/r3oNWTdMkmY7D785cne1V+t2OcO6Y
X-Proofpoint-GUID: 8X73CqfUAjQQZfPKhco-oeHsEObyBQ8M
X-Proofpoint-ORIG-GUID: 8X73CqfUAjQQZfPKhco-oeHsEObyBQ8M
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687585c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=g818jjc2pSN6WLbPb0IA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_153342_967694_DA2A154C 
X-CRM114-Status: GOOD (  17.91  )
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

On Mon, Jul 14, 2025 at 06:35:43PM +0100, Dale Whinham wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Document the disable-rfkill property.

Why? What does it mean? Why are you describing Linux driver firmware in
the DT?

> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath12k.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> index 9e557cb838c7..f15b630fb034 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> @@ -48,6 +48,9 @@ properties:
>    vddpcie1p8-supply:
>      description: VDD_PCIE_1P8 supply regulator handle
>  
> +  disable-rfkill:
> +    type: boolean
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

