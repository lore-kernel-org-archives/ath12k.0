Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC561C531E2
	for <ath12k@archiver.kernel.org>; Thu, 19 Feb 2026 21:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J97MP10b8g6XezEUSafkGrHBfJnrIsMKu0FinG57RvU=; b=DatR6yc4u1rYQGu+Julrj7YmHz
	uqxQlb1PByQ/DIpdf60G7bG290VoyMN/iCdrRbeFDXFIhekmkUs6r6MY8T1eqk5N/mz9rGJdgtXyZ
	97XC2OXWSi1NZoQs5oQUJzwFRbwusjdt4Y6Y0ThNsqM6xTwkHWAOvpSVJq/tSP/fdI81lqGF1ly9T
	a+Z3UsuMl9EgsOWBN694F7nijxtOih2oU/b8aHb31Sc2xy6T/DWzT5B9cLJAtRi3HYDvu9mh/Nqgf
	zoJUV+rFXcvRv2p+sTDs8JXJPfuzoPrj0wPJzaOd3tSmJAPwaUf3qQagGjPgsaTHJ6pZt9d7WRnr7
	zHnkqkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBof-0000000C6kQ-3J14;
	Thu, 19 Feb 2026 21:44:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBod-0000000C6k5-3n8k
	for ath12k@lists.infradead.org;
	Thu, 19 Feb 2026 21:44:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JKUFIK3564407
	for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 21:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J97MP10b8g6XezEUSafkGrHBfJnrIsMKu0FinG57RvU=; b=hlkat/cmrzHHmYWj
	iJtbXRVm6Ycxei5WA9RNRb2hLmBscVZvelbLhFcUWG3jcBroQWScAPuBUSsQRFwy
	ivFUxgf/5MqEPjFC1yvJ2vDJxFFuByLQyLVCrwkK/0dp3CuGlZiYC5XQWJpuxHez
	rr8bKwYwyNR6YMxiuG7Zs0/5ackuOowmLYrgiSxsRB17yxYOV1/LOO3Q86Sprucd
	KNciJ/EeoCy3akequmcWm3JnyrciKXGNNMS6rnJVAE6o80uyInJWMOY1yPhwjOJ+
	SoiIP2xOgPMSi5oPmumJYtvcl3MIAtM+bVXdK98Yl4SHG4zvRqGTVsCfgXliK7tU
	1Mw3OQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce1k81uv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 21:44:06 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12721cd1a2aso36435584c88.1
        for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 13:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771537445; x=1772142245; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J97MP10b8g6XezEUSafkGrHBfJnrIsMKu0FinG57RvU=;
        b=iprGCAHjzNQd1pzz34xHCuMN984qVXg85taBXU/O3Y4TBSNgtrKt9b3Qyii2JrDyDi
         gGDxggtEbXOOZcmuYkphkXqtsJjN7YqB8+TIGiGUKoMsSqoA2uyjqs2w7Prs12pv6uvy
         1C5zwvs0mC83dJn9iXGOLaN9ra932829PT2LAwl/v58xWtGZuMb3poe4/4++Hfv7Wnik
         FVQG5fu585JWC3oTceCcLhNJQfEI5RZd4hsfqogNN2axm1goxxBtg6cv+bzPeQF/i9kE
         78oZGcHXJpe8fM/tDv7ddDt1Y2dKvSj1fEf0ZGfERyrL8TeGEQst0HtPWL6mu9+wIfLE
         MLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771537445; x=1772142245;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J97MP10b8g6XezEUSafkGrHBfJnrIsMKu0FinG57RvU=;
        b=Fz1LBbZe8BxFrBVQNujHTtgBszF0j1JLcFR4iuVgN2yw208kH2CADlQuaIO2kU/pmJ
         /6l8ZrSgJd25LVeKOweJ6QDpI5qc4NmR2jtpOviS7CxwTXUfNNKoG2yA+HyqW9tgSNq9
         dXY+fdvIV2VUhc16XJQviNWCxGNJJuFx4dTKbfIVK7gupsa3iWHgJ5ZDk5pr/HjP8OVR
         XPXDZjnLrBXKG3s9sqrRIOdlOzhNJqist1DE78QThBzTneXFjZ8j0ov1l8AN8grkm3m3
         R5w1ywBXTCWtFcnGgDDRer0qsh6rJQa8F9qx9MLJE8BvqbAsLdMTOJx2+qcODI6CNIsO
         XuLw==
X-Forwarded-Encrypted: i=1; AJvYcCW16+bavpB+nRaN16JBNYoPNweTq4nWY8f2ChQS2IOOPSeZ2fOkiqFsDuedXOLba6xEYiJwfr8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuCQy6Wam6DLrBWD/iNVVKIBAD2+8d2XOSIx8v5XTxYyo7AZRA
	ADrIfzp/Tb5W7A7OALgShxD4ErzN043WFNB0nPb5NcCHdXm+6/XIOkb0GIi54s2/QXM2qB2vc7D
	IG1e5Hm0KEDHyuyYvdWwcb0BZRpm46q3EITX1o7N8MX9BtKyRheLAKieEsuAs7af+
X-Gm-Gg: AZuq6aKfldlhscr3CXxSiCcFaeriggAtt8Hz272+G3RwwfnoiM5HX1iheiQlN1+5ap0
	3WDerjCo8G0Tv9lU7Y91wzeal+LwNXp6eE+AZk03c6//0z3VPn0d+Z6u70V3vYUXlE65H4kOfB9
	tB/aAfskBIpxEJL7LdLG9WyygUpLhE8wRcegFyEJ1XkQSieQF8ZMuUtzthXlmG/om9QRXDERfhw
	xMjbJJbdhPgpwOZyw3ewW3Hrsq1unouElCGphVuI0+i+YpEJr9KqCT4i1e+/ctTHe9eeQVLXFBF
	LDhwH722AtM6/Ursnr65dAwQftMslIL4vgZXf8u9QoB7F/04X1EuPjBaPquG+Zt8/6qVtF3hxZk
	UU2Orw4ETjhNL0S07WHvxcBCGpe4KlCPcWNb4aD3XUoj8F5Ah4kQRagqsT4FMgsG0TO2LOqRQqO
	GDYZdzBnGjrU79Dw==
X-Received: by 2002:a05:701a:c94e:b0:11b:9386:7ecd with SMTP id a92af1059eb24-12759a93e0dmr3760112c88.42.1771537445242;
        Thu, 19 Feb 2026 13:44:05 -0800 (PST)
X-Received: by 2002:a05:701a:c94e:b0:11b:9386:7ecd with SMTP id a92af1059eb24-12759a93e0dmr3760092c88.42.1771537444621;
        Thu, 19 Feb 2026 13:44:04 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cc83e6sm23579410c88.15.2026.02.19.13.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:44:04 -0800 (PST)
Message-ID: <6d8849c2-a58c-4aea-863f-6e4c335ea4cc@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 13:44:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add basic hwmon temperature
 reporting
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
References: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GO_UZyql08QD0WPn_JDXigUeWGKQ4275
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE5NiBTYWx0ZWRfX36iMBloNJC4B
 dWFIX6+4pL0ahjUQE8DnXyLmoB+jy03ctUFQ1yCCDrHeCEpz3BQ74C4NPsvvPUzMiQsa9SxXOF4
 d0VDz6wdJTgCo2JX+sFr5lhkggdcf+wfN+JS8PKdxiQcuV0TN2MtK1CYXm5BVxAu2xv+uF7+XWR
 452SVLPbH/5cqdomVFN/fxxilHZGDBgNcNMRcSa87Vz/1YAsSVp5x8n1KhCNays/M7/yh6Va59J
 zUmQREPPwiIPgmyIs1JZlLNP70Ln/pZSqgHo0H43vlvno1XsLnIvOrMzn4x3+TiasePdM7mG5Gh
 JX07qmwK9cWRBrCFt6WqyVbfzCxjx0ROAYGOkT4eybEe5NRvMyARtMK9cCT3Y/Vd/KsQte/50iB
 d6YZzpP9fGm4tdXI0UFINwynj6IZYva+FSpVicZVngGovLo/00x7jl3LhWUxOodSM0BkAU/a0D/
 RABpNmooWN3SVTNcrbw==
X-Authority-Analysis: v=2.4 cv=cdrfb3DM c=1 sm=1 tr=0 ts=69978426 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=3NmSqTEJfTEM0WOFm6UA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: GO_UZyql08QD0WPn_JDXigUeWGKQ4275
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_05,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_134408_066961_6893F80B 
X-CRM114-Status: GOOD (  14.37  )
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

On 2/18/2026 11:34 PM, Maharaja Kennadyrajan wrote:
> +int ath12k_thermal_register(struct ath12k_base *ab)
> +{
> +	struct ath12k *ar;
> +	int i, j, ret;
> +
> +	if (!IS_REACHABLE(CONFIG_HWMON))
> +		return 0;
> +
> +	for (i = 0; i < ab->num_radios; i++) {
> +		ar = ab->pdevs[i].ar;
> +		if (!ar)
> +			continue;
> +
> +		ar->thermal.hwmon_dev =
> +			hwmon_device_register_with_groups(&ar->ah->hw->wiphy->dev,
> +							  "ath12k_hwmon", ar,
> +							  ath12k_hwmon_groups);

ath10k and ath11k use devm_hwmon_device_register_with_groups().
why doesn't ath12k do the same?
then the code below and in _unregister() that calls hwmon_device_unregister()
would be unnecessary since the objects would be reclaimed when the dev is
destroyed.

> +		if (IS_ERR(ar->thermal.hwmon_dev)) {
> +			ret = PTR_ERR(ar->thermal.hwmon_dev);
> +			ar->thermal.hwmon_dev = NULL;
> +			ath12k_err(ar->ab, "failed to register hwmon device: %d\n",
> +				   ret);
> +			for (j = i - 1; j >= 0; j--) {
> +				ar = ab->pdevs[i].ar;
> +				if (!ar)
> +					continue;
> +
> +				hwmon_device_unregister(ar->thermal.hwmon_dev);
> +				ar->thermal.hwmon_dev = NULL;
> +			}
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +void ath12k_thermal_unregister(struct ath12k_base *ab)
> +{
> +	struct ath12k *ar;
> +	int i;
> +
> +	if (!IS_REACHABLE(CONFIG_HWMON))
> +		return;
> +
> +	for (i = 0; i < ab->num_radios; i++) {
> +		ar = ab->pdevs[i].ar;
> +		if (!ar)
> +			continue;
> +
> +		if (ar->thermal.hwmon_dev) {
> +			hwmon_device_unregister(ar->thermal.hwmon_dev);
> +			ar->thermal.hwmon_dev = NULL;
> +		}
> +	}
> +}

