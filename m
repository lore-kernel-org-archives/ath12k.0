Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A641CD98E2
	for <ath12k@archiver.kernel.org>; Wed, 17 Jun 2026 06:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8sXKAn7NodoWIBzkzU7p7jMP8ZjJV9xJRxBLf7gKME=; b=jG+B8MxrfBw6HCiyfGdImBOxag
	RZ58UQStq4UV+vcISWLdxli5fUXcodBxaf+VNxG4hvBLGHNfCsg75r4G7GC4EtRtFXW/2iUpg3a2S
	z+UawfBvaRHuZSjAxkrnWIEJwk3GvPilMuknwsEFdjCT0D75xK4yEiSUxplTRZA0zAlS3DMlKM9mT
	/W6vCyxPE9SEFVcr40b+TZzQjdcATjixvdTMfYWaxrrplBSwcCKlY9fLnOt5KlmGr7BRU1l6RI76+
	WaAuChtk7xVyXXYZndPKKx3tn4BTI1k1i3/h6fLbOt+IuTdEXpgaBueQJ8y4FyP8nHL2FzBpkQ+KY
	cxaUttGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk5A-0000000Gk1F-3QJh;
	Wed, 17 Jun 2026 06:49:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk57-0000000Gk0s-3Ta8
	for ath12k@lists.infradead.org;
	Wed, 17 Jun 2026 06:49:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H6hmrb2025702
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 06:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l8sXKAn7NodoWIBzkzU7p7jMP8ZjJV9xJRxBLf7gKME=; b=Oqhca9NpkNjoPHrU
	OyBHDR/7YOx0lJO1pRj+NfNiZJFzHic4mFFuIxYlexNnb36t9GO+xgFSiWsShLJ2
	KV/5PdY9KkoSsnCzIJ19LeCPHFzndI5JffqT+3fIrNTjKOZ97tV5hG+SOa5G+AjU
	NOWvxZ5LHyff07USDUogk50XVSz6tLKs2CiD6oFZihPkLJcKYG/xGOkSbFxCPYSo
	sRyZUgFtz7Fy86+7RBya76+eoSQmWixCzhjVCGsQg8O8tY9U1io6OQ9oqW9xrr0U
	nJlS3c9Sab8aoNvA55nGl3N5NOSsD/4SkFXhzN7z4dtIiQ+9NtavhzBfo/xKOkiD
	W91wGw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef29v3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 06:49:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c858e0cbc89so2965023a12.0
        for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 23:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781678940; x=1782283740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l8sXKAn7NodoWIBzkzU7p7jMP8ZjJV9xJRxBLf7gKME=;
        b=VzE86r1erammCXjryKFs4pq73L6h3WIqSS88hSBGIIT/fybpmkLXQ/44+sXW/GOo0u
         nHmEHZNRbOR7ykrqMmKXIKJyllsMMJ5sx/kbTYNJIxxIfdn6tBHRLqhdehB5VYub11J+
         gOOw4aSHrmsQ9aBfoxUHQXbI/hgpkYelUTozWQMlFKfcoMN1ncE+/ahMioATHCrsN4Qu
         ZO2L+/yGznYC3W5QMBes10mIexXCl0y0s/EdiHWNgh0MM38oheFihbN7JFAfaVzxeYBz
         fNcKihoYjNY9vedGkMmbFAKEn9G513jEp7R9yP4ybIZJzCDrm2e0FEzQFvJKZY7uFnM+
         /33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678940; x=1782283740;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8sXKAn7NodoWIBzkzU7p7jMP8ZjJV9xJRxBLf7gKME=;
        b=DCCQmU+BlORaGh16PJ1ZLSmWylZvkfSnCq5drLtGkXBy3vvGtY9/qtla8qXQP+7itD
         D20fMKlvRwwwBHYYzeO6ZzVvYVhWxQz4Ux7idCXakMegLk0ABrvq+7YhdDvAstlfVKmd
         KsDz7ohsQrEykQGCSs7Plkg6EHeH8OWkJKSsDMu8w+giMiCQrtLVDPJ00m8sRwhUfZUN
         jmlgy2MqJxZ6ZMo43bURh0fBt0dGdMFQ4DPRhtFZ4j+ttDVSGRqP/9qe9mGewCdUxAVU
         w+DKGSE+4a7wUN5fLhylqZo4h8UiwMO5koCWLKfH4BpWzTsxFXOqPDQdI7wNBUu9CL2m
         daDw==
X-Forwarded-Encrypted: i=1; AFNElJ81XwkWs4k84LB/io7j7uZnUkgtKyl+OVjfaQHql5LXW6pUwZhaD+84+9R4CeVaEaiAt26F3LQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwU+qyP6+XkNnUm/YXl+lnPw99lNH1frLfKUViNaNwwZSKfdy6V
	GgatpCyH7kdMe3hHqDdxe8F1Ak9BlbGt9IVxRlnNteRa/rt4RiHBk+w8cAom7/awHS0fdG1GvTl
	MH+0esmjb/vPwcCeeGOE1fiyTExD3lDo69hXuni83MP6ZvAOfV+V7D/W66ntfYq+hf4VEL4Af
X-Gm-Gg: Acq92OGl9g3sdxkCSGjunBVzh6esI8vBvf1fWGoWFlN+8Y+Qq1FSDVNSnHWIFlE6FKq
	vhqQK4cOYEN5lGIMjGvQZ5C5aDn0OXrUHnglDQ/SogwscjRaxuhLIH81vikspxm+CvUb97Z5EOu
	urN4xzTcDxi2cgIALm/tiHKkMTx3ojr+yGV8esMWQhzWbcDiHxIxj7+BaK5dNHL+rzjrSCcoeZz
	RkHCMdtapNYCdRwFwlyjtRFxmsIzp8atyjG3pwY3xBLWuQNEyXDgFzzwMpMzwXlP5b6ogo0IeDe
	0lMoDai2+su7iZoVQW6XKXMzzKh/Z1eSU2ODJvvd9He2MFcvV7QIa9KoDawFIoUBWKQtqmHwHBF
	1yMtaznrxyfkZ41ehkyJqXkHH2+UjmTawvjlSVNesLlyAlIaM+wg72PtB6Y9ciSmVbtdVZwI4mn
	5worcPmHY=
X-Received: by 2002:a05:6a20:2583:b0:3b4:e4f0:94e1 with SMTP id adf61e73a8af0-3b8bf0bb23amr2810054637.39.1781678939590;
        Tue, 16 Jun 2026 23:48:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:2583:b0:3b4:e4f0:94e1 with SMTP id adf61e73a8af0-3b8bf0bb23amr2810035637.39.1781678939115;
        Tue, 16 Jun 2026 23:48:59 -0700 (PDT)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651af080sm13543921a12.29.2026.06.16.23.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 23:48:58 -0700 (PDT)
Message-ID: <177fd404-dc48-480d-96fe-8a79394ba8e7@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:48:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: expand UserPD ID mask to support
 up to 8 PDs
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260604031551.4178754-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260604031551.4178754-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a32435c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qcwypVmIGuKwP8SevUEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA2MiBTYWx0ZWRfXzbvvXehjEvj0
 NVWANKvFx68fHChlNx++jHBwCVS8rIqh3oiGL/Ww//NSlHq0P1OWeN0NbAHWwR2K/kOrAu5DQYD
 k17+2B1kuxBbRoJ5BHvERZNFMKaSIY4=
X-Proofpoint-GUID: 1O5raNSGDh1lksz19gt1mQq7WlA_nyTM
X-Proofpoint-ORIG-GUID: 1O5raNSGDh1lksz19gt1mQq7WlA_nyTM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA2MiBTYWx0ZWRfX6S5W2ReMG1Yc
 FZDoBAe79EnWYdg6WzNCgyQY2iz5blP2h+QgDihRMuAYHXygk49U7xJEPloDsTut/nzoZxfafRf
 +lxQUaq/3MOzc7NNBrGKu1fcmLMzoKU5KW3OwGxhv5t/jgIuJ4mceQGwYCpmtNxAqOWCdSmrU85
 0J20Peagn6cUCDxaCe1QxA0j71pWBiHcnigWfjt1YCGrJLdSOnXF1fVDK8eoZH5xQ300HkEPyvY
 prXooLCuhJ65nsqT/+7ZYgPZGy7f/UVJ8KSv2g0uTD7PMvt2u6TixckvpvkWvLlJPK5e++jhOwH
 gn2XUcWQPjTumJExZ1H24T+lDrcnw7yzE3ssdSlcCX50DPRyFd0tFza/d754464ozFPseBFDQzq
 F/yBfmfGONmx0NgPgA2Qn5sLzfipUsrkZOWb3+zKJlO5BkfcrJFDMs/+iGVADcZ9Xv33+fl5Uke
 9yPSW5H7ZYR/RBIgHBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_234902_017751_8C4D81A8 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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



On 6/4/2026 11:15 AM, Aaradhana Sahu wrote:
> Currently ATH12K_USERPD_ID_MASK uses GENMASK(9, 8), which defines a
> 2-bit field and limits supported UserPD IDs to values 0-3.
> 
> Future IPQ5332 multi-PD platform variants support more than three
> UserPDs. Expand ATH12K_USERPD_ID_MASK to GENMASK(10, 8), increasing
> the field width to 3 bits and allowing UserPD IDs from 0-7.
> 
> ATH12K_USERPD_ID_MASK is currently used only while constructing the
> ath12k AHB PAS ID, so this change does not affect existing platforms.
> 
> Also remove the unused ATH12K_MAX_UPDS definition.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

