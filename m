Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD28C43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 15:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/Y1MW5COel2wWx4p2DALR7RRNLnSVd1oYyWrSpSJXk=; b=k0eij43uJ3UPmlTRTF+2ID9rQW
	ITQGVhCO9KnzH2/HDZfdV/DkdbvdBMqmO0BnnC9UO62/xCeeZ/Dd8Ti3pQgXFelrRzYL3hROOeVN5
	wAKvHuQt3dcv46T6X6JG+MJsWIRdivxaOTdHRkjk4dfFr5EhGiCbaqpeAMJ8IWMuV5LXwGvAYwJ7v
	1MA4ef8VZp1XKJZb6PWLeEgB0msZYdAGlKjS4/PdBDWwAgm/VJFcrbwHtwyHksBUHFL1BLMxGYSs3
	rtQPFReupEcUvSJ3JGwBUOpc0J1Mbb0/dUKBznvbsXbcMZXjSBc47+Nz8pvilSm+xx4fmoTYmHmx+
	zeLDBO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffU0-00000007MVp-0Dqx;
	Fri, 03 Jul 2026 15:07:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffTx-00000007MUI-1mkS
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 15:07:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Bhf7C3135225
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 15:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/Y1MW5COel2wWx4p2DALR7RRNLnSVd1oYyWrSpSJXk=; b=I2laStE7JVO14Zny
	RUxphdbyneMw1OsRlTiKt0N99oI1NUu4z/tGStXgdRwGaWC+kYOJ+B0YCoFSgdZk
	3kFuL3t4LyLKsVcAQDoHbZBAdp6uHK+DAp1Lvyg/4TDPszJd3VK2f1OAfufBvxXB
	HWDTC78TO/jS0BMzX1rmYzGuPS6h6LYKvonLQlGWwobLQEmNeTVNVD4wtPSFw69b
	/YWG2WQvs0zTl/iG/65M0nNCwOOvyH982WAl8ISIzOHiWx6RisnoNPrGzuYlQBIy
	r2Ayt+rO6n7GP7/qDetmB7+9Y3D3G/UW048SZ4923U0oQOznFMwLEf/z/Q75j3d6
	OswDTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcjkb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 15:07:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e66fe6152so14503685a.1
        for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091227; x=1783696027; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/Y1MW5COel2wWx4p2DALR7RRNLnSVd1oYyWrSpSJXk=;
        b=TiUXneuwespl05Mm+BaGM3y0IRUKK4QNQ6y+XcdnZEQYnue3fw9ZSYzU8t1Q2YG5AS
         nC+jN8PZO9k1wG9xD0c3N2UtU3LlUxXXxSqVsq0wuMCbFaoRAfgWTT/gcsXG6UeKmkf/
         mhQR6WC7BSSLONupws97CRd4KaY/VyifNtNM2ZPHipBmYdBWIeRNILVFe4p+R0p8DLBv
         nuHjhIUariiGGLyoLP321UI5On09b7TlvGs6HdHaGbgI4xePDsldGA/Nyve5l7i+U+ko
         TdOyKMBeA36kABZyEdzYcTsPKoi0D7t00b9hxbWF1hv/ngBHueHCo0Pk0+aiuZaJwtqD
         f36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091227; x=1783696027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/Y1MW5COel2wWx4p2DALR7RRNLnSVd1oYyWrSpSJXk=;
        b=qSYZ0iGFSRkV3ltVrP7WMRgqFMENhIOCxNrFv/vGta1t/dDZpFexsAOhA0zoxY+QKq
         pG1GLBKZrRi2B2nbZ6P5CcI9yNNruDDwo0KzaQeyU/bRjHEY+v/mu9watQoauAxO5W9p
         Kz8pHrjdBkB67kWTPb6KvzeL+x8UVwzrwRKs/PCoOsHVMsbw4P6GtJMct2IDvwRMH5xX
         saz9py2H5zxgr1yUW11fcqrW4XB9efjei2mrtMcT2EWoM8xhygMr9a938/74ZAomCxQf
         vdTkLsQ+xFvaRRqRDzvPIWVIRZItqzsPBDyPoplXmCauiYtJwHYFCuLmMikacWPQgRgF
         iclw==
X-Forwarded-Encrypted: i=1; AFNElJ8bMdG13oz2IAvphhEfHQjpxTfoR1U53MPlIbu/X+rL6fKLV9ID2ngg3KvgX6CrBDOvnBDJIcs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+hAIDHuusf30XNKXTcn4xh6nflWLNIKrq4iKfsjvo0VwT44Ya
	wIZTQ2U0wG81odQPb1BkJp+6lO0g6U/A1drcSVV8BNnrb1KGFpcnjGpZ0CVl3orLo4OMbW6Daxv
	8/Jq0/VQbtYX3xoAz9ZxVQZmHDEpTW6tuhxHnqAuVoJ8w7zOWAObC4G7y4osgGNE2
X-Gm-Gg: AfdE7ck/BAg9VYBDgFLe5/ZHEtMx9RLoKxAz+iRGfuUCt9QXr1MshV62VXL1mRDpZnM
	yiM9mcDxnHjkmN+n+PRVtd0Mt8+VtcdwMPN9IIe4fuP2m20IXlHUQ/Hs6H3nmVBMSS+wn41+1Qy
	Bv4/d3KJa3wP+VNx+1IGMwKzKemYDKJ3WPTS6pv4P1BYHCiU1SoTPASeN0blW1phWUOtNqtNK3k
	3JWjb5jO6CuLfsVrb+agK5sY5rPSW83edHdhJ1COkhjKfsmafaVK708GdDHG3JRPnQ2532NnXCM
	ygvexRNWiW3kgNrNd2YY1dRIcSzN4XpIoQIfzuGEQVD4xTYEtW9TLJZEiy+coYoCGENg8cvi/t2
	QLHbYme3SYZY5mz39mqusmm4SR2jF1CXbDAs=
X-Received: by 2002:a05:620a:171e:b0:92e:705f:1626 with SMTP id af79cd13be357-92e784f65a3mr825404785a.6.1783091226806;
        Fri, 03 Jul 2026 08:07:06 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:92e:705f:1626 with SMTP id af79cd13be357-92e784f65a3mr825395785a.6.1783091226326;
        Fri, 03 Jul 2026 08:07:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628d65dsm295433566b.35.2026.07.03.08.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:07:05 -0700 (PDT)
Message-ID: <a2dd4a61-2585-40aa-9d05-18b66f3450d5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 17:06:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j5tOyj_BM60Qlnb4SqcjocRW_3KyZ3hQ
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47d01b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DWWpLck2SfFL7czMIZ0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: j5tOyj_BM60Qlnb4SqcjocRW_3KyZ3hQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX+piVNKphsZM8
 jLMGhfX26/kYOuFIrrqpaSOwlYKBwOrP1GdS0wcqioZVN91/Nk5TaW8CRhcJ2zVAXGZ3/ORf4xL
 asQsSzRhKbagZdovtWbHqdox1vWlt6m6bI58jUCbL2x3M4VmmtapXAWk0lP7eHtmEYI+5oG49PT
 d37VFT5KBVx70bQbMYvDgHZMvjF4vX/Riy5rk5+idrDo+ZGCv7uApu7ge83wEXosqs0YJIX3lLb
 TZmrBTTUti4VlUQ3K/jbWjeziLoeqRxeOn/78FQ9ftgWpx9iliiX4Pt/u8oNOoivopPDI8pYzZx
 8WsaMr04IU9x9G35xJkJXLZ2VQDNP50sa5dM+u3jqasR8XoiDMJM1qXR6aUGfuwFDdvhUAdB47r
 UMmunqD5bRGuOoOQebC02tJnII7aPDXuBLarKoS4KVIuQi3nEmjCu8BxIObvuf2KhWzBsX+f+QY
 WmxIVxHsw3bItCBbIkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX4BebkaevOkTT
 dyMCPQL7vCmJ1ArS2rtd8tgjCiWvre4VlI8BpHEQ7MEVPXkuul4zYtKVDM8YWWLxzYigePTOwr9
 GQmIZbqWzyx7qx8/IUwlJsgzMGOwp9I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_080709_586512_2C62C9FD 
X-CRM114-Status: GOOD (  14.39  )
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

On 7/2/26 1:58 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

