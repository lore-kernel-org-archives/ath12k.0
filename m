Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D313CF257C
	for <ath12k@archiver.kernel.org>; Wed, 19 Nov 2025 04:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ja5dOuwJAg4YIzd4nzL3Eh6NhlzRMEj83Ch39YAIhpU=; b=cHXecyWYansTjYktvWGclZfldr
	TRHQf3l3N6F9eX54vI+RihakRD3Zu5afvAPEDO/Bcf+cDBw1jInGu8LnXmB1EQSxP2J2lUQ70y+1g
	PDcx1Y94EFXb9Qt7v0KfJLgI4zBq3t4rsFU0TJ+ed/ctdVtzNkIlK38c/pCKKOyiHeAH8XQTFvXkU
	lTYUham9UKbK5zYzfxLbnQHJUGZOuPPVWgmq7TPM5GZKSQjeKCHjgaofgofnh3r9P6hmKuWlbPW0C
	E6yZ/7LLRJp+ymTDlGQWtj6ZweR/vaJ3LnzgYy/qVXzVapE21XKrbtja4L8lTkhsjJHsNDRayS7EB
	RycVp7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZgM-00000001fnq-389N;
	Wed, 19 Nov 2025 04:20:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZgK-00000001fnF-1Esl
	for ath12k@lists.infradead.org;
	Wed, 19 Nov 2025 04:20:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ2R5lq3165030
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 04:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ja5dOuwJAg4YIzd4nzL3Eh6NhlzRMEj83Ch39YAIhpU=; b=ne752AvpcKeujgUE
	2uGgBpW2z/TrdVZYDK/615aXtvgMqcKwnuIDz0SWqSXyfia1FyGkiZHGNT/XLVNI
	Xqxgg1sxcXzS4TXQa2VCPVe+i7YKx9zvPB/zpgdU8W1I00V1OS1u2msdDXwr9xJG
	4OuHH0r1g6xK2XXlpKhSeI/RD/iWRSzmKTVWP29VnJT9eXn5uJ98ToLlFcSaXen1
	m/fYyT+3nuuBEDMktCPnBRRmkHqY14KT+CDXH5yZgkipib3gkYpUiM2n5o0T1EOc
	9clvo89VapV74hQNGdMvaRLRYQ6K72fmUYUqP2fNVWRNZmgrnIJWNWQGFQZYny+O
	EKqXAA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgsqu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 04:20:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295592eb5dbso50881215ad.0
        for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 20:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763526034; x=1764130834; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ja5dOuwJAg4YIzd4nzL3Eh6NhlzRMEj83Ch39YAIhpU=;
        b=Ht2ZGWBK1BWEo7iOUsCy70e5o4QpYXRav51PpXUjPcn3LAWnBOG5xAgmrXELZxAbaP
         /7Kfny5QPduWHuGbe3fFgUlIMfS7mA77rfKXjdb6P8h9jx2+yB4bXGMjr1o2id5ZxdZJ
         RiiSoAl1g2GXUyOAd1oBdADBPM1YSq+5CI1n6KXqCwdchsdpDrR+hGAPs13TMEailVCh
         ReS8MXTYrlnEqMlCa8eiY34KM9f7Go5dIqjBL/BAawLes3XvTwRB5uZqhZKTaezAm17j
         Miy7QWCKW0VPTzDwEUP+uBawuZ2tE+MNxfzwpkGq1l0phWJDEQArPTOXXAjz6N3Y8k0y
         nZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763526034; x=1764130834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ja5dOuwJAg4YIzd4nzL3Eh6NhlzRMEj83Ch39YAIhpU=;
        b=VlEQZaUGt1mnAFMzgI691yGSmR5HHteOMy1KhpoqcI7S3mFNdJF9DkKxZAjzVgTqiF
         N+lBa3DLiZ+c9+SMDRJ4Ten5P/otr632SW4nkwt0iM+3AUy1Uu7P3QjAfd/bu/dwO8fV
         YSxp6lkFNhPK28z1bgFn9XboAOMDdmlaWkrTIds/2pDBRakkYoljrw3R1iPKRa3xEDVl
         SM3jvMEcWEK6lRBpqmEcfN3QdN1kWARvs9gm/mhJ8ea6GQfjEbIz/NPUT6zPcmjWO4Fb
         rA78X4TFNro/5GVV0IB9FoGuQrExmvqV3W8dzov6w7DoKzPxQg3ac05OX/JlZMeYIRBS
         Jy8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUY971EcZiSMiCuR0veDJSuN/X25aQezP+iE+TZpkv+c99gWczdSgVtgF3pbn8IahoULf3Z/VM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxJ/I9fhGV+H5JG2ZzF18jeiH7HTwO7NJn83ibk2ZrpCtPK/90
	rcIsWFnKH9rb9p/vfDT24Ce9oFjYjbLLAZcOko/gocfa8LGXdWQTjI12uPws8AnejdolAfUd+/w
	jL8n1kT0wB6HNTVK6Z1a8xuvSOxltSRKH8eShrZxVxTHT21mOatL0QO/yMwGz3ItP
X-Gm-Gg: ASbGncuRnBGOuT/yvpGorGtLeeSpGxEjmgYDPoGRazEkH/YbXCFTI8cB2r07sgs1dYK
	asF+OvIptlqb3hIBifGIO8zrS25O+E4wT8lEgE8DnvUVuhmKt0+4VZ3JbkVC0LsAZcIz5zGQ5Ja
	NLmgb5LTI5qyYTn/HpeOH0HwCP3ocWhoS0hQkuFn/TvDUtkj+3IlwbGgYWUmEtEa/58z0RNk2wS
	TjI3nzatQzMpZs8jE0KU2CE5ruqmnt2o2fNYOKlle+WBAdjtqaNz6BJzVNiiIqK3UfmwNUF5QJk
	kHZRXSrJpRXkTSc1cOSYlT/U3/+NTjOdE0aBmuQJiosBhVx90AkgBRX8CqxoZkew0GwYp6/gcHz
	vX9ePDMYWMNQymnl8cfATawnO7M1jEWqvSLmq8XZOsH5+SAPS7mJJv9Q=
X-Received: by 2002:a17:903:3c47:b0:295:6d30:e268 with SMTP id d9443c01a7336-2986a755dfemr216204995ad.59.1763526033659;
        Tue, 18 Nov 2025 20:20:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVbTciutVO93xK7yxqRWlbbbO4+eMrZ7cPU6rbG23sfCDDFKDCVcw0uV1r3UUt9BwihNE1Vg==
X-Received: by 2002:a17:903:3c47:b0:295:6d30:e268 with SMTP id d9443c01a7336-2986a755dfemr216204755ad.59.1763526033191;
        Tue, 18 Nov 2025 20:20:33 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm191107285ad.36.2025.11.18.20.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 20:20:32 -0800 (PST)
Message-ID: <8f587649-063e-9cb2-42e9-88703c59cde0@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 09:50:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath12k-ng] wifi: ath12k: add the missing RCU lock in
 ath12k_dp_tx_free_txbuf()
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20251119-ath12k-fix-missing-rcu-lock-v1-1-8155de1dc4fc@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251119-ath12k-fix-missing-rcu-lock-v1-1-8155de1dc4fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FglTQWUG0fvVWozK-myWZHpfTpxctwUm
X-Proofpoint-GUID: FglTQWUG0fvVWozK-myWZHpfTpxctwUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAzMCBTYWx0ZWRfX3en5bTiSbP8u
 9xsK4Xl2S1uM81C9wo5sBAmoZTVKeq0YDqjnmAhzE489kkGzJk6OLSNi5HBWwSqXh90QnFsmsBd
 MyuQ3N8xzLDdkNHiov6bxDNXZq6b2tdo5kzQVfpFTsYUkxLmUUrDWKRu8xBmBoS0ifRxFREqkJ8
 5iW5RhUvUdSLAJmrGFuXFwkBzZME8M2zoFfPELc79k8Xo8EkhCqTZ3QWLLj4OkgUMDIPA92HlHA
 ACS5EdTTkoyjdxYgN+44Ft6MFj8cTzvOkJ/faKVTp2H3o6TrGJ/Iu9u0RlJaaekqo0YjbV3TNBI
 Yd4yNUIdv4tqJzMWKyQaTxwraHTVrBO27PTs/TH3ejkUS1vitN9vAtrj3B3spH61KHpbYC2UZAP
 Eiid1lYdGsZ3tYVfyhjz8Tx41hM+Lg==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691d4592 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fpXTjR_PzDRLIX1BWiwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_202036_345648_295A95BA 
X-CRM114-Status: UNSURE (   7.90  )
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



On 11/19/2025 7:45 AM, Baochen Qiang wrote:
> RCU read lock is missing in ath12k_dp_tx_free_txbuf() before calling
> ath12k_dp_to_pdev_dp(), causing below warning:
> 
> WARNING: suspicious RCU usage
> -----------------------------
> drivers/net/wireless/ath/ath12k/dp.h:653 ath12k dp to dp pdev called without rcu lock!
> Call Trace:
>   <IRQ>
>   show_stack
>   dump_stack_lvl
>   dump_stack
>   lockdep_rcu_suspicious.cold
>   ath12k_dp_tx_free_txbuf
>   ath12k_wifi7_dp_tx_completion_handler
>   ath12k_wifi7_dp_service_srng
>   ath12k_pci_ext_grp_napi_poll
>   [...]
>   </IRQ>
> 
> Invoke guard(rcu) to fix it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

