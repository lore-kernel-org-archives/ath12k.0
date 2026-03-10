Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A901BFCC9A6
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 00:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=; b=A5dwMEy2BKgc26A78ANbDJnAag
	OPe5u3npFxgqZbxXVw4TSFfp6JHDqtmUMZJczdLPsnd31CHYfO6RGJhbnu79hvtIXQzAU/6gnrdyg
	sy06ffHRkXtidmTqxl7czIp/MQ6S60SLy3e9xprvU+fRMSNzPBKODIeXpG8dzZD2hL85vTApgQ6tE
	tIyNzRKkj8Swwpdkwa09CY+6d3/akxTt17U9vKD1kNHbzRfMi861b+zYA1G2rvsZA/hdLCaGT4IV6
	m4vbIhnBXcY0kZbe2XPaRgs2FePmmDy9G0avzduTGnTVySsdOM+Ib2aca/tvQnlEp0GdLBPADF7cl
	p2svZ6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbH-00000008MzQ-1oYL;
	Tue, 10 Mar 2026 00:05:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbG-00000008Myo-11mT
	for ath12k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=; b=c0GIdJVLflfjPgMuR/PexqAS11
	Sx65bSbuwKm5dOJ91fOZpf3v3Q+jDZfwBm58lOIzwJRSOQ6ilDH3kkpjZnbn/RORE8Bg/GmPTaJBb
	T/i10MJkDTS7nu7/RQ4/N2iFDx6f83D6dKZMJBgJ4O2soRYPNSmFbz4jPcfvnA1uoAdyqpEkqW70S
	9c2Gkx7mkQ+qihOr6rSgT5qLXTe05i7mEMUE/bcDBHQ6lPZ7OpZ5lNGktlAuDO4Wr0Bl4PNsiBklF
	cIx1VKGQU3S0fWQN8GqhALTPi/BQlazfWTmed+mVzod/7yz20fK2A5k1Yrt8I8rdZUtZnzYTAey3d
	CpVx0d8Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbB-0000000DNOo-17Jt
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 00:05:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JFtuL2872799
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eq3YR8SJMJVvMJ+9JHxKSwsU
	I6gefV1Keb8jWt7Lh3M=; b=Vr9LnGwXIh56NKbRnXZ9oGqugFUK4IhcHRzvq3a5
	Un6ZQ8s8T1noY+p3OJ7nIlI/pFkfv3cYoEM4U7/xltLCa4Z/F2sl289yNUEOLOBa
	Z3BMufsHHwruxHaeqjTrfm6GUyvtFJbg8+zVVlRX1F67+pZN2/f57ytt82EYhETZ
	OewgGpdBKuqvpKxd0OIc6KSPJV+25un2J5yp3XmPiFYJMQ+y92q1SsXDbwt6Jmi2
	8hHVAJIACjd7Y1J5B9g55NXaSqTp8r6jKNbRIKYDA86kvmEp8GZBpLP2wJWX4hO2
	SEac3DT7Y/5jRBWsKq2SbbWyH2StPJI5fzOoVYyq7M6BDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477gqmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:05:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd76ff19d5so1426327285a.0
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 17:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101117; x=1773705917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=;
        b=evwmnmQ8gqLiHw43843oJD3rCrveMSFFH5GyNAUY8jipZmIRZinB73CxJDRF42ENy5
         uPDyiFzwCY4h3LQoeMzm9sOLXHxYEppCWxMBSPoVuPomaf1JnDXdv0qAg3u+DiUlvVdY
         QStwEuHO24wBqozBK7A6tzdrZkzgD8PFqdtHtnZqFEOPYWRF3gCNiVP/lkXNZ7+w23U2
         0dRVXok+42egrLMP9BWLtNbuXZJd8FrFGt67FVwALbssJF6vFPo93nBQ56vjmPRJ5+RK
         GAFSwV1zUqEOHZmqg9onMLnzfpe9gbYm5NMNG2PyoAU2H+MlQkhdSL4Gg01yysezOjNU
         Mn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101117; x=1773705917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=;
        b=kI4ChK8keS38t29Tuc68+5mFpgDTVAHqAZbJwFNUa/GvIx7w/T2lK6p0jcROpjMimo
         ifFkIFnEMlUIG2LsgzbLtyERRB2FpaUJxTOBV0tigTsp2AY7rE/9KEZey5TkWWxdARx0
         j30GD92dttD2LAVthVaAuhF2t5T59HW3ALsA2aYBsC6J2CAr9zu92hybUqCdpQ/2W6DV
         tJ5K7FfTmsfdmhXwD0rWkOyOmCiubiPuDPTFe6S4qt3js+XYrBgnenFspmVNfBo9IR5E
         UAsmYmxRcPs3SdcydpgErddBe+18D5hfHDx09smW75GBR3SRmXCmdN9ixhKNXsQ+FJUv
         TdPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUut0j/APfBC9D0Kc3uGGHh6yKTCktbwrQHUF0Ca3FMDiqA1dhZkLazSlh02acyMwaMlYeHXV4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ArmtC5cUd4XAnuM8gb10oRn2FKcs1IzWeQ3313MGLi52Z8j6
	k8T+a89SG4IVASFETWEXcUtQ3m6VB7EbpLZIAYo1KYsmCz8YRhx4X/1pthaK1JFzGS0jt/Eg2jl
	HLH50AUsde6npSnj7sJ38p+jYQjRBErewkSS7q73XRK5H2c0r1X2cQwfo1FMesG8G
X-Gm-Gg: ATEYQzztUc0qHWfWD5LoiEpC8a2tb63CmcqNhHmMNmCW9GO8+rC7zsNPjrV0XTpbhSx
	1yiWy+k0myQWnYVog/x8e5krpQWKvm6di6JfdAEPptCuQVsqBER+DFhrddQiW/4Pza9m84EaYY5
	mAJs9O89LP7kzRyL4/Jaz6x3uVh2OxTff8dJ5Stj/t9/jvAIZ1nNs0p8ypJUW9K1X0qD81t8uDJ
	eb5BILAbPSZwd5rOTKaHaPPPufiC1l0POvt85ZrpHV/fMdrTaIYzkNcGmTCphSfmtbJAhjjjZfL
	/FVGT/VmrKg+n4HzyvGZ/s/0zLivBvvizap4CvD/Ni8GCwUXvHZSr8qqoMIPDF6dIjRqziswel5
	DDN4+qBf7vvf48B/rbVXLCLt6EehaIyaAOSTgdTSaVWNrUbJdqZeswCrJUFkv6e3gmKaE3wYD1j
	Fch3R5NFXO1DD5nTl+33lN6j29hvjZenjYftE=
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr1601783885a.39.1773101117003;
        Mon, 09 Mar 2026 17:05:17 -0700 (PDT)
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr1601779485a.39.1773101116549;
        Mon, 09 Mar 2026 17:05:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cf6fsm2324914e87.11.2026.03.09.17.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:05:15 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:05:12 +0200
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
Subject: Re: [PATCH v1 3/8] net: drivers: wireless: ath: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6mm6z62o6xlso7mxyelx5zho5iowh5zfa4tlbfsexrb6vohzjl@citw4jcjsgsn>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfXxEkSYNeqKUSy
 J9DDbO2MJlA6gm1iikNWuEOAq8oNVd03fbXEvDi/wJ+kFggsiheriG40htBYtqjkQPA2DOSW4o3
 88/rjoF80B+oRzybOyIlJEhO7FWVvvy4nYYekqTbKb9qfX66C+0km8hkuTSIkYvikNCbcDnghEa
 aV0gMpS1ruO9d73NCT6G+Lk8kkRTx1hW5Ad1mhakIHOpi7qzDJEpzkzkoAGHFDtgMpxR2ICKZt7
 8FoNzwlWTQzaspofEiVX1XYKPHkdQH37gUp+KqTVvlQPyAN/rY9Oe/LoDJDlIy7k0YRHAYy1taf
 PEgtHVMI6brnoAJsBG9d2sLMJuIpRJwLPj0myaFiTDXFBZeU1otsvJMOu/StKM3aFKyN7Y8m174
 ygLNWt6W936sFOlwpSS+9OVd3GoAWdH12AV5Av/Cg/MQSvmjhEB72fVNf21ggUfkFaV6d0Z8WrX
 x5fJAo/VP10Cg2OgVtw==
X-Proofpoint-GUID: 70EMxBf4NgULIOWvkmkHdzzwRtB0A3PN
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af603d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=n3fwWfvLsPu2TWPVUDwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 70EMxBf4NgULIOWvkmkHdzzwRtB0A3PN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000522_449365_4EA823E0 
X-CRM114-Status: GOOD (  16.15  )
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

On Tue, Mar 10, 2026 at 12:03:32AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
>  drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
>  drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
>  6 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

