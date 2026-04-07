Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81AF105D986
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 22:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjGZu1nMIYxEH+BkM12qs+iRxdD0JnnyuDFHzOWT/rM=; b=d5eN/OdDusJtmXVq/qHN29yxMm
	ZrduLsq0KC/4PSo6aHdZppdtjFVnUUlmMpH5pWVyHTm29TYgjvtG1FWNjDQMVobdBNYtXqdUuUukW
	3XERux6YIWsVCxEOpvqVMvXaCnjzeMAtdWES+HEGSMGarwqh46y9OLnkbyzZTBVbCTSLG4KtjmIwS
	zGXdcArJQsrmzJQ/FnszAbn6ESeLwXVHqEs4enki6CnZamPD9IE9+PerKbXnnQ1FgO6WH2+EepR35
	7zyokFUnVBAjbnit4GLTpaU227Po2LEYEybKnbE4lAb9B8LC+1JN+84ShGY2FPa4H7359Q7IQYnW8
	yPirNCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAEgt-00000007yTs-38dn;
	Tue, 07 Apr 2026 22:14:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAEgr-00000007yTI-2oOy
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 22:14:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J71N9072568
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 22:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VjGZu1nMIYxEH+BkM12qs+iRxdD0JnnyuDFHzOWT/rM=; b=OweH0Y2kARoYn1W1
	qq3nLdCQrnMusgkFKVH97SH/YIOnMEsAfAZK2KoiG9Gxh/8/n7cU1UsGD3/JY+O+
	TnCC6+QeX8Z0IUKHaUmjTIypZ2H0UfYbyJVOT7JUEat6dMR7LzZBxjoLQJyQmwOz
	hXC6WmTAPgKiCEnt8sayLvxEaf1aQEZ3KVbNm3zDkVgkpsYAgEMpiGSFzicXC+GT
	zLbUcVWQXj925Bce1NoFoyGvgQBlVpoEnadvPpUlxJC/tmR4UarU4h86gc0j8iqn
	9zGvFPUfebfRPl8K/kWd8XSw9wadeBrURZDqQNVSPOk9jaO1/Rspujy1bXSio4MO
	UaKy3Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sx8gsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 22:14:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c16233ee11so7871801eec.1
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 15:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775600066; x=1776204866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjGZu1nMIYxEH+BkM12qs+iRxdD0JnnyuDFHzOWT/rM=;
        b=XPChusCO3GuAjWVZHSKpCbJ21nLlOsyR9T0VwmsOXO3hAasfPgyzc7aeEsv+Ns4B8R
         1Kko4XVvtDKOfk6sP8iZ61vs4eOHXJFnSe6NxUbsAt9wECeQM2doNskFoKi+cUBrIM/I
         Pd2OVGjA1YSwNHU46aANTHwRqfZ7CZvyiePHa+4RTF+KBW1xrVJkyoByoJ1iq/cxvI7e
         /2tOyV7Pb1Mz4Hwl4h39jT+Ur4KB3X2d/0dCwLvQ+te4tm47kqauiaHLvqJIstsG29WG
         NUoSBgOBLcXo3qdyBwoN8qPgyx42taCpBBe/JpYWhBydEOKLsRfnaJ0HClRgXEIoRqLC
         kNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775600066; x=1776204866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjGZu1nMIYxEH+BkM12qs+iRxdD0JnnyuDFHzOWT/rM=;
        b=dQ71C9bPY9cVzLl7FkAtDQ0yw/zCk4CajtEtngWKnorSTejqXJt4bU6JIPzwoyrxNx
         yJEtpPC1OqRZNn264OvgC7AAfO+R2V0aUwJnsO6etyapWsaHRxmJ9vQQdX4B54mKovqi
         Kd6XjchQJWBMISarfLuzO5MvLFpkFgmd2KdKQioXONOuLR/YpwLCcUnQz0MSZkDAsMi1
         gRNlDTwRKy7usnwd0ZfbDpfrJvV2VHOccl+syCPZVrW8G0D/uP4ZTRopYleohDBTXN0T
         JFULAey+k7/MC8GXwxJoSt31B7HYM2Q7Za7RlmcNuRWuEPTiw2KlzQsCufdPWzUCr7x9
         OJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCWZUozn3fxII2UPSm1HNQEgDUvIJZ6qcIHzvOM0GYJBL3jgTA7icN8SA7efivaAvFnQtYvkhKc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdKHijPvlqteTecdxqtZs/czTS4MXTl07sg270QCUXAlBHSKu6
	Xxu5R9MsrTxiFKqioLWDMAB9hT1VKexxEjL1oD7tY88isCnZzxNWeX3NKKmIoqdRzFT4hvMl1DA
	MI3HoucnR7WSpe9xzt/xYJ19lUJFQRTfsPhNO/K0epqXkm9EGeJ3ZKlFsr/5SGx1B
X-Gm-Gg: AeBDieutsA96/w6XQYnyobsQlH8UhfWw6ZWmNbky5SIhF1KzM0qH/MS7MfVc43Hrcvr
	g/eNa5Qs2x+MC9ewcjU6Kn/xD+oSBEswyMPW7xOZw8aNX1f85LABPvuOpQxlu/YwzMEUnIRh6Z/
	j+Mq6z2TyUklWl4C/E8HCyS0ne/DNrFhtjWrVxCFXixyy7zzYVR+VJD4IQ6tIt3o37IL8/P8djV
	GbgEaClcm7La6/1faue2POE4AJprPiRp9UeXKeYbbzpUuktMddMZIug1RdYKd+kcIP7u96+g6zn
	1ImEtk11MEv1DSCOHux39tV7u+sEV8nrCY1QLUNAgVlbVS7vkOJzaoNrtdJIpsdjlnc/JTFqm1O
	iVbX26qbHz6PdedQ8cV0GWPRMxeUM6qBZpLnERtzxGK6Lh4+dsxQwgEZCltjrdEQOeIcPMO0Jgt
	db23+a
X-Received: by 2002:a05:7300:880a:b0:2ce:f3d7:20c with SMTP id 5a478bee46e88-2cef3d70bd3mr4324860eec.29.1775600065601;
        Tue, 07 Apr 2026 15:14:25 -0700 (PDT)
X-Received: by 2002:a05:7300:880a:b0:2ce:f3d7:20c with SMTP id 5a478bee46e88-2cef3d70bd3mr4324829eec.29.1775600065017;
        Tue, 07 Apr 2026 15:14:25 -0700 (PDT)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cf2be19f85sm12178552eec.30.2026.04.07.15.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 15:14:24 -0700 (PDT)
Message-ID: <439f9bbf-1ba1-465f-b5af-01ba0ebb86d4@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:14:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] media: qcom: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-12-sumit.garg@kernel.org> <ac-KQ7e8-syph1Zl@trex>
 <adOcMsk8a_Clb4WZ@sumit-xelite>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <adOcMsk8a_Clb4WZ@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d581c6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=nRfXl0x10UYwF-qtBXkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: ua8Nar0hyIg77LBEnknYDXvEFAenErh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDIwMyBTYWx0ZWRfX7960Ogi4ee8H
 Dh9oVRLyBLXJXGJh3zJRzMnJLZDfZKGyJLBLnl1gOBc3H8rKDBgNpByco6BXs2BeQbAl7UOQA0q
 eOPP7d6IKkPbGTISaKgUpX4fMTPxr9P5MezKTMQqXIztGSIKaqqzofFNGyEpls0iN6il/2VMQzt
 sGgb4IIXx6K60L/DhTO7Ufs8+r0bqTi2mAa7s/bkYxiZP+rPv8qpsZv+9YZ8LF2HL7ZxQz8gCXn
 JCru49RH3sva1zrt0z08GthjZ2F8Sw4Z+5RflQDDaA/RpS4lvaOPQQDmv4rB5Yc76g+fJJ2r1Lc
 GHDLDVMwEPSo29/uj+EWsBHkMb7sHniToBKWpUmtgjCzGWD/deXlQmrkcix1fXQDUZLhZfno4Hp
 FVSeePbWBcEty7SmjAMaELFEOjs1HmdVW3QZJ15uKRK2QwD6hcGBe3vU6Frm2DCrFZb1tNR3nJi
 tbzsMPnUwpJEFCB1kCw==
X-Proofpoint-GUID: ua8Nar0hyIg77LBEnknYDXvEFAenErh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070203
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_151433_878760_CAC9AC05 
X-CRM114-Status: GOOD (  21.14  )
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

On 4/6/2026 4:42 AM, Sumit Garg wrote:
> Hi Jorge,
> 
> On Fri, Apr 03, 2026 at 11:37:07AM +0200, Jorge Ramirez wrote:
>> On 27/03/26 18:40:39, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
>>> TZ service allows to support multiple TZ implementation backends like QTEE
>>> based SCM PAS service, OP-TEE based PAS service and any further future TZ
>>> backend service.
>>
>> OP-TEE based PAS service relies on the linux driver to configure the
>> iommu (just as it is done on the no_tz case). This generic patch does
>> not cover that requirement.
> 
> That's exactly the reason why the kodiak EL2 dtso disables venus by
> default in patch #1 due to missing IOMMU configuration.
> 
>>
>> Because of that, it is probably better if the commit message doesnt
>> mention OP-TEE and instead maybe indicate that PAS wll support TEEs that
>> implement the same restrictions that QTEE (ie, iommu configuration).
> 
> The scope for this patch is to just adopt the generic PAS layer without
> affecting the client functionality.
> 
>>
>> I can send an RFC for OP-TEE support based on the integration work being
>> carried out here [1]
> 
> @Vikash may know better details about support for IOMMU configuration
> for venus since it's a generic functionality missing when Linux runs in
> EL2 whether it's with QTEE or OP-TEE.
> 
> However, feel free to propose your work to initiate discussions again.

Vikas and team depends on some of the IOMMU patches to get accepted 
before they enable the EL2 venus support. Please reach out to him
and Prakash Gupta at Qualcomm. 

> 
>>
>> [1] https://github.com/OP-TEE/optee_os/pull/7721#discussion_r3016923507
> 
> -Sumit


