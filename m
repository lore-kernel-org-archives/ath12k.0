Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7424AC5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Txp34vbTY5C3QHBb5kcsCTYB4ex7ke1L2A4ilPvEFKw=; b=yrc+DcF3rDY+QVmKhLW0g51IEh
	USlAVh8NQpnPuAYVC2hpdtknzkl3p9pEoFQ79y/QIGPcSBMVVIJKV4Ec5cAidvle0xZ2aHljHCZx9
	EMq90pWaMAZZCNHbczzCz5fkulV9Ay5khwVmzhDXEMvSMEO9EauF15UxcF7VRTXeceiWr6/jtPAmL
	h3ZI4B7mVlrgjGSUa/XLNLJOAfjPuqnMeO0XqN5j8VET55h3RFX5pt2NVCrarWS09s7YbPCzwHJxf
	LnbnaDKRxHItr9nRXZZCH6d6mHN4GwJSLIwr9HjxahUu4PMMtvFJXOyO4OjGNDPAl+RhFEEF7yn+A
	ULPOrT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdQ9-00000009Wzv-0QJy;
	Wed, 19 Aug 2026 10:21:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdPt-00000009WwK-223a
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 10:21:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8uti3730837
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 10:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Txp34vbTY5C3QHBb5kcsCTYB4ex7ke1L2A4ilPvEFKw=; b=HEYCFSg5qFUhLLzj
	lx0Qf5QJyJn7p+yeYBe3gRz3XFaqDwUeDR9BM/q0roQrmIBytTYJxQIuAEpGpFE/
	7uC7Qi0YWdHmUp1TzKcjX5oSZoCp86SG3aWnzjbAvZtVWFruzSht+7onfeuXh6AZ
	qpq0781FZ6ENSdmTii8vMdcBhMdXVTFaLF9PqZX2BoIfjD5MHSewSS37fG24CMP+
	bw3Mchc//+PfdLy/H/pQyQtYWf3j/GlMJfuVTyrpVJDdZ99UJugya5+h9XHA+10t
	MNXaqvS8zo54Kd7OisWDsjdrZqABm2Gm/Iju5pBU8c+gSEdWX8HVJUeVvDHavpOG
	Z5RDSw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmamtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 10:21:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so976764a12.3
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 03:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787134864; x=1787739664; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Txp34vbTY5C3QHBb5kcsCTYB4ex7ke1L2A4ilPvEFKw=;
        b=EFnSJGjQWYbJbu7wRwgwS+VqJOqCZ+JnIIYlSwxhQAznecH2p6Af8cnD+fHbVgRJMy
         bhRm5UC9WXLYr/tUz/td9aOFVeZiHEirGO8GMpIMEDXX7JAh2s2aN/dnV97APqsN6gnv
         YL2+i32pn0odLrpBJcXndnoqYZXuPyW6OV1WZxHynmIbz3f39Qg2CvUc8Q1esnLg+ZCC
         XbBc3ng4wLWrAs6+8yTPyexfX/Ggg2z9eHwezkJzrcGiM2J2lmSuha4sbIZ14JsZm+F0
         g8S3QnU23LsaYBZZueSki4HTQS4e8IKBzxgMr++QFwYAPYd+PUV7bVy9b2Hy5UL3H0Ew
         aZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134864; x=1787739664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Txp34vbTY5C3QHBb5kcsCTYB4ex7ke1L2A4ilPvEFKw=;
        b=GdkYG26S7oQX9VT+EWf0TTL2dWhgEHp7E1H07lQzUha+59lLE+NhO3z3I6E5sXys7E
         3vLw8yZYvtBrIbhwgZaU7KPCFrwKUrnx1kCie5pBRZ/YnTEOK5IMASKcGMddrTF7CR+E
         RAyWJPIgyxGy2R70ijSGLOwtbptiyM0LP5ITrula+1Qys505ie5XsGRxsOAzM5cdQj1X
         NQS/CBt6XZ/XHex40yAhVWcNmn+l2qXAN4dQuLrNS4vdUj/2Y3uOmWWrNQhM3noQZ7QA
         RYazX9k0g6I1tL0rL6Txwg1F41a2mOsDRDYxaC0h6c1OkpXz9ROY99u9jjNL/kht56y1
         C9rg==
X-Forwarded-Encrypted: i=1; AHgh+RrwdR8e9B7M/qbhDXgZw+UU0+7YebwXRurJoOz7PDjZHFn8NfGFAZ0nudnntwmVZuit+GCbtMw=@lists.infradead.org
X-Gm-Message-State: AFuF++mIfvpHW32NTCtYmRVin366vpeV89kB0xou/tulHj7Ve/niz0Iy
	0QiVtGErR/c9cU4pL0ypfVF/4kmXHl+s244k8d25wZBJPNxmFUJWk0XtCyxX8IPXQNBaFfWKLk5
	a+xiejghpRYJe0ElWG0IKd0+LLiAJT3br9iI9jTrbY4b9ELB4TaAvlZBQTk2FI1mA
X-Gm-Gg: AR+sD10Jz2DHm/QhH8HvKOtLBFSE2YG9/MDKbZGtmDl2BDoMmmKIWIqw9SxRTS4zwJ2
	0X2ETODedjVEZemq7X0XMZ0dnOQFe+fjDI3GIP16Jv6QprAbzab93gZXuY3oxUm3b0g4YnrfL0p
	JHGL/OiE3uNLdt/MjOq5gpuAB4hdf4/osXsLugT/qaXGm2af1s43KUnWMh5QHj4Vpd/Nu+YRq+5
	Vv6QYuuaQ1dP5QwbZU93XXZ6kc0eFDkAHdh5+ub9CWq5JUTWuA5QVHRi1k3OFOxvUd86q8RjDnq
	czNk9hN+IQnF9kVlQWT8/Kcxgn16Xl5pTLNmQ6/qfcmhqzA4duvjOyvoQ4yDS+2FgmIr9MdTpLt
	juOJjFn+3Jg47qM25v9jw30DvGPAG6cNDZw==
X-Received: by 2002:a17:90b:2b4f:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39580f0d585mr7179842a91.6.1787134863707;
        Wed, 19 Aug 2026 03:21:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4f:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39580f0d585mr7179728a91.6.1787134863070;
        Wed, 19 Aug 2026 03:21:03 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm10077903eec.26.2026.08.19.03.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:21:02 -0700 (PDT)
Message-ID: <d1de686c-5e46-42b7-9dc2-02a4dba5686f@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:50:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Free allocated CE IRQs on
 request_irq() failure
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20260819065425.2044186-1-aaradhana.sahu@oss.qualcomm.com>
 <20260819065425.2044186-2-aaradhana.sahu@oss.qualcomm.com>
 <3be7c1ed-6298-4d85-bb47-3bd0337eca6a@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <3be7c1ed-6298-4d85-bb47-3bd0337eca6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3OCBTYWx0ZWRfX01YH0two9WLa
 ojjHuupTy8Ub3igsbzMs77fHwacNxolZLcRbb628cqAogtYiIlMU62SZqPKAgxRXOzxP5OFXGM2
 HwGg5ghkbmPWAWbKNug3OuIyCI1LupkL3pzlVfb2AKmImG7n5czKd6nzMPmtFHz7gy2N8DXYtBr
 BBIFa/VdBou+F3HkZwy9VmfJayNluKeF+IuFFWrKCKkqSgvx96Sjoat/wlpCIad+N1+2DPbVXFf
 5GCEr7gKkrHI2V1ipZOkTrWtUZOEVEikAceH1PVKFOoW62F6X+9nOkPnO8T4qUuQG/SqqACOfBA
 XuPBxSSqVoTM+URVQaaeFBEHvflbd0ftG8gdBj+H/j4NukuXx3cpSy0H91Mzji2KsctVz6CPN46
 Z7BN8NNBGKvmdG4madyrcziNC0y666hv4BpfOoqdbNRRWHiapnWkEz4ef/vuNeEGE4L3WnwsSlD
 OVR8eGlljkOgvMb9ZBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3OCBTYWx0ZWRfX+STcL/Ri02mT
 HdvhlWApzVgtj5ydxX76g8tM+orI2wYhqnW5oa6PaAlzLNLdtS4x5xWPFwzVXoeBJqyJK92nv3n
 wnfXPT8IcXsCNlGzC2W2jsng7Jh+njs=
X-Proofpoint-GUID: cgnkNtvdkKAFQXW-SLRy-A4Hi2UT2bkK
X-Proofpoint-ORIG-GUID: cgnkNtvdkKAFQXW-SLRy-A4Hi2UT2bkK
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a858390 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vnLL-qGiFqK5JrfbvNcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_032106_555804_C7CB8CB0 
X-CRM114-Status: GOOD (  18.23  )
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



On 8/19/2026 3:43 PM, Baochen Qiang wrote:
> 
> 
> On 8/19/2026 2:54 PM, Aaradhana Sahu wrote:
>> When CE IRQ configuration fails, the driver does not release all IRQs
>> that were successfully requested before the failure. This can leak IRQ
>> resources during probe failure.
>>
>> Free the previously requested CE IRQs before returning from the error
>> path to ensure that partially initialized IRQ resources are properly
>> cleaned up during probe failure.
>>
>> Factor out the CE IRQ cleanup into a helper to reuse the cleanup logic
>> during both error handling and driver teardown.
>>
>> Also free CE IRQs when external IRQ configuration fails, before
>> returning from the error path.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/pci.c | 29 ++++++++++++++++++---------
>>  1 file changed, 19 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
>> index 6441927b5382..9a78d2f69f94 100644
>> --- a/drivers/net/wireless/ath/ath12k/pci.c
>> +++ b/drivers/net/wireless/ath/ath12k/pci.c
>> @@ -313,6 +313,19 @@ static void ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
>>  	ath12k_mhi_set_mhictrl_reset(ab);
>>  }
>>  
>> +static void ath12k_pci_free_ce_irq(struct ath12k_base *ab, int num_ce)
>> +{
>> +	int i, irq_idx;
>> +
>> +	for (i = 0; i < num_ce; i++) {
>> +		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
>> +			continue;
>> +
>> +		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
>> +		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
>> +	}
>> +}
>> +
>>  static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
>>  {
>>  	int i, j;
>> @@ -330,15 +343,7 @@ static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
>>  
>>  static void ath12k_pci_free_irq(struct ath12k_base *ab)
>>  {
>> -	int i, irq_idx;
>> -
>> -	for (i = 0; i < ab->hw_params->ce_count; i++) {
>> -		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
>> -			continue;
>> -		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
>> -		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
>> -	}
>> -
>> +	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
>>  	ath12k_pci_free_ext_irq(ab);
>>  }
>>  
>> @@ -671,6 +676,8 @@ static int ath12k_pci_config_irq(struct ath12k_base *ab)
>>  		if (ret) {
>>  			ath12k_err(ab, "failed to request irq %d: %d\n",
>>  				   irq_idx, ret);
>> +
>> +			ath12k_pci_free_ce_irq(ab, i);
>>  			return ret;
>>  		}
>>  
>> @@ -681,8 +688,10 @@ static int ath12k_pci_config_irq(struct ath12k_base *ab)
>>  	}
>>  
>>  	ret = ath12k_pci_ext_irq_config(ab);
>> -	if (ret)
>> +	if (ret) {
>> +		ath12k_pci_ce_irq_disable(ab, ab->hw_params->ce_count);
> 
> ath12k_pci_free_ce_irq() instead ?
> 

My bad, I will fix this.

>>  		return ret;
>> +	}
>>  
>>  	return 0;
>>  }
> 


