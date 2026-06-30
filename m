Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C20C43327
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81yQnZbApfVfIiH8t8XJoiy0NXKJCRUaF/krfaGmans=; b=XJoUTQtrcmRd0s+Fye8H6iMTa3
	7kiQWvZmbr0gvd2gwOUzjo+YTa9LsOfDaRFbMt9H+nCjtop7wf7P6cCymsubKpz8fJANgwErQDGvT
	qcChjzpzhEL5y+z9Qvkc5AS6Fw1VOAETXvP91zo1mfWlSIM9Jzke/t0OwBDmaUXM1+DTm14IcIFPm
	mB/ewSXAefVBOxkRSqzvXSEmSOmu0Kj/+0mqNxP330M2EwJZffegxbx90I8wfbdhWPvB1EJDpRcs6
	sptOs8L2p9Khxn+UKXG41tKaIwRiO3/1PRnwJoIuFpdDXy6s1m/rZNx7TfMprFACPDCVZL7fD+6YF
	+yGewgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXmN-0000000H16W-0DtH;
	Tue, 30 Jun 2026 12:41:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXmL-0000000H167-0Iw1
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:41:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtxk1542148
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81yQnZbApfVfIiH8t8XJoiy0NXKJCRUaF/krfaGmans=; b=PZsvIHOwGcpw1Si8
	mjM5tSeCEW73QMW3pin7A9aNwjptzuikOdaZziRc9EWb+Lwj8nI/lcJb7cE6za6h
	cLx9tEcWyKYljPLsaJkqt1rhRwJpacz3La/f77wc05T8v2A9GTcBWr9dJtX341vN
	bUqEp5fLEOESTWBWc8CY8zeqUKgJqBiaG9dsmhBfd0CJHqYaEq/2IrW/rwR53imk
	STlC6MpL8J2CK4lIgUtWLqlG8+r4dS8XU1CHJMlU1ZY7OU5Cvf5uHI9dn6uDylJI
	C/7DwbOC/0Viob79NGAGUiYF4EqwK0c1g1SpktXNREopXQ82rQFYORYlJIwhpBe2
	jS7SEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4jfep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:41:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e57e56ce9so22636885a.3
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823287; x=1783428087; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81yQnZbApfVfIiH8t8XJoiy0NXKJCRUaF/krfaGmans=;
        b=O7nWo1JEjWwKpNZfk1fH5dDyp1evFV55MtG7y8sFDTZgRF0yFWh/ic7WEE4x5Q61rL
         o4cQ3CGodKCaUjpRCtFFML33XuFKpyf+4AkYFs4hqmmf6eQRv+3Fsk5ErDED4AFaHKtD
         D9gz+IkqYd9Yq7Aqd/+yOcO4ufnjm44kLrkB9CQo98usRakmIEZFZeVBCVAmoTp8yM4t
         wIRn12SdzCaxsbf72CVfYJtdaeGrR1t3oiLU8urliDtNQlvpXtfHCuyKsjAIYJdQ+s3H
         LLcoj5LbqLhsfaTrmsrxI/bR8PD50q/yNo20fJ8GRMZZ/cBiQV1zV0p31+/DT/U2MabJ
         m+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823287; x=1783428087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81yQnZbApfVfIiH8t8XJoiy0NXKJCRUaF/krfaGmans=;
        b=VC2Eck5c+wYPKcBlDrIgErE85LQF7PY5xKDPd49FxbUwFEobKVT9+CuhhbwJ23bMxQ
         1SEeMIK7n1pKsl8oU/g83Xl41H1PKJ8hu+WIq3PFbN2IBO10MhhxP2dbFRt+WAW/oxMK
         m9IlY16VcXk1tWT0cmg7Of9K85h8Ynkbx1aINV847Ol/tHjlIYsk1y9Lc6lKOIjU80oo
         N2GI4XeFLtOtR9FAqYD79Qztnr+3ZQsnJMxeX1PPOntEafhVohQ6RkKKV7XVg5SUJl+Z
         9rvmLIGn6ItiJR1Shk1n7MiKgiDq65LuyTokiMYDTs7TTT6/xdCLlnKiBbYpRTzrGSFA
         Hilw==
X-Forwarded-Encrypted: i=1; AFNElJ/nTwK2gqkt3kYTJ0vgLUSzhdZVTQtJ+jXj3jFPo8hi4xovn0X54YwO78rqbVNXwyTI5cC4W6U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7A+yJ+kXx8npZp8iM//XBVdtKLipnjK1igIRsqFj7CZZ+fAxm
	2Y42n3VKgqCworTuC9rs8D+Q0BrGgA6wwD+5XoYUg9pEW9KaRGoLAugOrpnLP2esQns2MsLjrlR
	hJH5JjeWCGHDCXbyPHyS6oRw1dF5ma3d6YXe7WXDwrbsdWYnlrPQJ8h9LAhq7nsOU
X-Gm-Gg: AfdE7clqxh5DpFce0+WgXj3LcAsMYIVUKHNO1O6ssuHbqeg0ZhTzuBR7gCIeeG7AQiN
	s1YrMEtvK/OgWLtr42rWwWPb2q1H4QhqnUVU4pAVIeT0Y3Cp4UuBQ83F2KglDwbyD5gpar2zryb
	mqkZMqeoxVME2vWZD4GlzMvmyfzhzelc/BOGtc5xnspjeZAP9C5YenfVrD/KzXEC1ToYp88JVku
	CBRlMLo9Rrb+7SaMDSY91aDg6OCQJm/jjqdf62QbULk8nPNw771JJjJrif4uoyFYD6Y6J/Hq3+o
	aVIKDBQG1e0iQyb46gsWmcg3W4Ln9xdXLr3nt2DBTjxxaMLmgVG+hZikKHxafHLs63sfQsttZg9
	49gbWfZL7e84uv/WLSHQo9SKxK31BM/cSIWk=
X-Received: by 2002:a05:620a:8813:b0:915:4ca0:1210 with SMTP id af79cd13be357-92e62689c4amr349002285a.3.1782823287428;
        Tue, 30 Jun 2026 05:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:915:4ca0:1210 with SMTP id af79cd13be357-92e62689c4amr348998285a.3.1782823286896;
        Tue, 30 Jun 2026 05:41:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d18735sm121211466b.6.2026.06.30.05.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:41:25 -0700 (PDT)
Message-ID: <ba22eda5-bc7b-4ac3-92e8-c14c4dc13483@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] media: qcom: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
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
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-10-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-10-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VtdfFt6pTpJRNiyKCu0HT13MUrsknT76
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX5hN6bkZ6LBUV
 BkjNkEPsgOnfk3Z4goDnp2Yq72qIpffG4LE+aasjrDcE8iH9zkdMXEnfTHL5ABSiRqm9nuyIIPd
 U8cBc0P6sjKb4XlvFCXOR33dvHqLFjk=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43b978 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GN6ll2GKXf5L_uNS5a4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: VtdfFt6pTpJRNiyKCu0HT13MUrsknT76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXwnMrLTNQPGk3
 MyPCw00RBof5Z5r1bR2zzuorQLYXi8Tkd4y9Rkk5SdZoprwh5yiTQ2CvgnotB5F2ORtSRoUvBLu
 /d4LSKA+66x80vSps8nZA0+ts6WCJrkUkmAVrGdBa8i2eIJauTleXU2Al4ecK5L7CzGj+S1uV2F
 Ca4tZNLVNqj7bN8k/mHp44rJeoY967Cv3jqGAQFOw4QzcLdajE7Wz1HEdJRvbRDRmmEzUkhX17K
 mSTQrjQWB6/HL1Wn9nsr7t4ZT/GBshBg/KJndSzWmK5wyDLVme49lAd/Sj9siTqeVXnAs1AIBvZ
 8pPGibJHgtRUJCDMev9SkRfOIjwPEPQpUrgvsbzLHS4uztQzxiAW04/gt5DtxgzOrGawcVRyTma
 X7W8dCwjl6b9zRDXc30EuNfskSEape5aXZ6knWrc+KNEBY9I1CuqW3PtUEx693LD2fm5JBoAocH
 QnTf7tMudpmR6Bun+9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_054129_120573_80603E5F 
X-CRM114-Status: GOOD (  11.51  )
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

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

[...]

>  config VIDEO_QCOM_IRIS
> -        tristate "Qualcomm iris V4L2 decoder driver"
> -        depends on VIDEO_DEV
> -        depends on ARCH_QCOM || COMPILE_TEST
> -        select V4L2_MEM2MEM_DEV
> -        select QCOM_MDT_LOADER
> -        select QCOM_SCM
> -        select QCOM_UBWC_CONFIG
> -        select VIDEOBUF2_DMA_CONTIG
> -        help
> -          This is a V4L2 driver for Qualcomm iris video accelerator
> -          hardware. It accelerates decoding operations on various
> -          Qualcomm SoCs.
> -          To compile this driver as a module choose m here.
> +	tristate "Qualcomm iris V4L2 decoder driver"
> +	depends on VIDEO_DEV
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	select V4L2_MEM2MEM_DEV
> +	select QCOM_MDT_LOADER
> +	select QCOM_SCM
> +	select QCOM_PAS

Hidden NOP addition

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


