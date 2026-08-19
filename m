Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76385C5DF86
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9cmhcvWFCUaFi/ELcC0gyefUrDSv1cLf3/+rNb/LbE=; b=jo5JQslW9erTD6CDhB0839nGEq
	5NNQa4KdVPcX7MxsaqLsxKPEYrgWLL/Hdi47+OZeRq8Y79TKEM+UX0m6llNAiYRz57grWUhTz61X5
	e0vTnb0mDlvAnQEmpJuMjKits+t7MBcU1ytskZ1PfanLF2b8NWhdSv/9RuWgKnFscY/SZ2GQ4g+lD
	arqg3yy+O412ezqt+2mPCb9o/tq6U1yfpaZ6i23LLSkmWJqoZRMzVMSYMHZKiu/a9viPM48mT6cBS
	Rxhj4V+igyJEU5Ut5hAGexlFvszHGfs8crxv+Tn89GodxUIvbXsM9wYezYXtLcSoyE3iwTMawZLBa
	ecY0+X3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdIi-00000009Uj5-0BOo;
	Wed, 19 Aug 2026 10:13:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdIf-00000009Uia-1YQh
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 10:13:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7PCd1018933
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 10:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D9cmhcvWFCUaFi/ELcC0gyefUrDSv1cLf3/+rNb/LbE=; b=FEHR92zTpCUC21HA
	7aG6fhjxF7OPyO8cponxzFjeXTmS27lvIYo4mw1+XLAM3FfjRuKjWRB3PdjeTztJ
	AwN/jwLRAmkKSBFIsLItqkooZLFR1KzIzrLshxG2NPdDKOOsp3tfdmYVx5I4XeGB
	tMPTTC05Bv3DENRONuSCp/NgVAbhBiqlhPZECNP2f3s8KnG7oUpMfrSgQkFQ49TA
	hq7y5/xwQaxq5lkhM3LZkcchapD0x+YN6kWQo/8iPZHKcdn4jBM6PQVubWn6BMXw
	Qv7MBBQZIEE1086tN64S2LVRYAE5fdXUFxui2ZveFBuoGmpkmGftwTo13uti7wfc
	VHuI6A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm2keg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 10:13:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1281818a91.1
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 03:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787134416; x=1787739216; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D9cmhcvWFCUaFi/ELcC0gyefUrDSv1cLf3/+rNb/LbE=;
        b=IJKp1LQwyLL3yqATzXA5fxv+2N/XkGrdgH3g0aCPbq4yqNDvZg1pCxAwxMnnPr+e5K
         0Jhzde13yCSEwVLZvOPmk68aJKButZGdBXEa58BYgNq28Nx57Oi7i8eDeYzMxczEejU5
         gFMErG5DLCtRxnyEKcyHbWK+3mea9SV92ZM69ZAOqMtxutXAay34iXp3m+WtZu9l67EK
         1VZhx690qxe7GARyqsN5ogCfZn5EVQyyGV7ZMi0LnWAGotjNV8AUpQhsvx54t/eF4L/5
         6pq5M+Ve1sMOL8MGT5V6uZ25dms0K4NSK4kyonn3IVPmpG3ZYxupC0/45mwOu4zM41J5
         fmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134416; x=1787739216;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9cmhcvWFCUaFi/ELcC0gyefUrDSv1cLf3/+rNb/LbE=;
        b=TR17zYn+ZuMMwW/Uc1Q/Xdypxkkkq5xo7rzLfh0Jq53pJpR1uBZHTVY9Pc1XvJ4uKJ
         0u4gJzvWSYJ3v5tdiOUNjJBon4WrSgjc03Ka4Z9GSR3wrsix1gG+EaVR5eEOW0ZonfRJ
         gKvg7eEUzCFhNtWtJVCbdcE51l9iV/WZEL9dI5QR6fToZ8GoW33xPsOhuuGoUjqTkjCr
         Ar289fndVEOhypTFOsWWegHag8KN3HNY+b2nITrqo+161Yjzdwk4n4aTOhRFdpHeUGMP
         /+L0zwbfzaheJC3Oyg3CZ/TlbxDdqLVe8ImGkj3pAuafY9XckLNWjHZXPcRfz6FLVWOZ
         6AOw==
X-Forwarded-Encrypted: i=1; AHgh+Rq57Nr+myX16v8bet/HDX7TAnA4KcyKmUb1CjyK7vjI6hx5hcIOJF/olguMt1iSh+OogaCQD8s=@lists.infradead.org
X-Gm-Message-State: AFuF++kmr9gW3K1GQG50V8UdW+czjSXHNj88vQwEMc3JkYm1SNfewPg2
	ur8es8j+35J598PurExskO/B+J64PufX6RT0G1ck00UNDn/Ee3jgy/ZGSjlLGkAZNoJIFclqNpN
	EBlGonyAp64FFmzxmFagTnwqvzgBV2gLbvZ51uWm71yC+O+pXOK+uY9NBd270PuJU
X-Gm-Gg: AR+sD13PYbnSbbivWwkbGNIKFDS8dqieedCjofS3HdPranHO8+ZHswBHcDMkYIKQj4v
	mhdyl4VGmgFplVovHOrLt74LXmqPU13Xo/9m7uCjdte+zOuu1DHOYRmE0jOJE7USARNVDxejk29
	Kk0tcH0D4dStKiMJfZ0ftT8/kspiG+KFqsb9MxbHIUD8hJBAMsUpPH00bhi5X+NM1LVaDzOb+Pi
	FeUPekWQpBdwtovRuOErM9l/CtuyNhfCizq8aVgSBFU/4QMLz6NiQyi9b0TecXge1ZJqrZWUrJr
	JBmL6YVTAN5hbnYxiuWTpoH35FiJeObLBxuduNp6qEi7FV1Z7s9gxV1ME1SILejy1Dbo+zMo3Ay
	C8+5Y74isFpIHXYokQOFkzTb8JNLDpOdxarsXXycuNxwXvKeIaXv+rsoo3CgScQ11RkLwXB9eNw
	==
X-Received: by 2002:a17:90b:1f8f:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-39580840520mr7151769a91.1.1787134415848;
        Wed, 19 Aug 2026 03:13:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8f:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-39580840520mr7151672a91.1.1787134415349;
        Wed, 19 Aug 2026 03:13:35 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96cd4asm2304886a91.3.2026.08.19.03.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:13:34 -0700 (PDT)
Message-ID: <3be7c1ed-6298-4d85-bb47-3bd0337eca6a@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:13:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Free allocated CE IRQs on
 request_irq() failure
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20260819065425.2044186-1-aaradhana.sahu@oss.qualcomm.com>
 <20260819065425.2044186-2-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819065425.2044186-2-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3OCBTYWx0ZWRfX6I63iebS6yNA
 KVN+Bp+beH8M5S2EVQ3eCQXoa6Sk3e8q9LIk1FR0EvAH6FuvoTkEZIrYjXRyDgCqiD/OL1nq7BP
 SonC8FsQQ/aqQ8ZWd9SKgLW1uy+TU+k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3OCBTYWx0ZWRfX9a5GRRNOEw/T
 w6Glvgy6ay+2k+4x6zp9RjhMmTOAfJDhh+zNr41JtzVYXI2WjwP/xdRZTlbR6X1FCg2Mvk2xNbB
 YBOJs72xKu7dBOfg/k4zW3+6XDXAdZg3yvxk/mG3PF5Cqm/TOO5r53vecRLG/e5HWdd+c55qK/1
 UIisiFj6ZZTOcbaOFogKPW1Ya69jCRPG0f1ulcj5vzztHpsiW1JHB+Qa9DDK45DA5MfddJQtM+E
 trIejkk4Ql76OuJGpgKr3Ug95c5//ChV4c+3Z2et2dCzE5R+5zofRWyFRKGEbdR+i9iUiR199zc
 ZxRwQjf/+fBmi2jQpDdFVfDRcCSjoaqntmQZw8JqbH2jtN6sa9c5FSotH68HrZrQsJOXQssDw7p
 +8UcPxaC0AeTewFwev1W4exhxAeiovTcDz2Cjfmv5rEu9iVce5Z+QX4a5IQvBJtxATM6c20GMpv
 wIJw1BEoqn9Mzxv01Eg==
X-Proofpoint-ORIG-GUID: b1taiYSMzJwepDQZA51huNpiCVkZ93FR
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a8581d0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BPQVpOrXsMq7AloIG-AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: b1taiYSMzJwepDQZA51huNpiCVkZ93FR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031337_418821_16DD4838 
X-CRM114-Status: GOOD (  22.04  )
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



On 8/19/2026 2:54 PM, Aaradhana Sahu wrote:
> When CE IRQ configuration fails, the driver does not release all IRQs
> that were successfully requested before the failure. This can leak IRQ
> resources during probe failure.
> 
> Free the previously requested CE IRQs before returning from the error
> path to ensure that partially initialized IRQ resources are properly
> cleaned up during probe failure.
> 
> Factor out the CE IRQ cleanup into a helper to reuse the cleanup logic
> during both error handling and driver teardown.
> 
> Also free CE IRQs when external IRQ configuration fails, before
> returning from the error path.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/pci.c | 29 ++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 6441927b5382..9a78d2f69f94 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -313,6 +313,19 @@ static void ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
>  	ath12k_mhi_set_mhictrl_reset(ab);
>  }
>  
> +static void ath12k_pci_free_ce_irq(struct ath12k_base *ab, int num_ce)
> +{
> +	int i, irq_idx;
> +
> +	for (i = 0; i < num_ce; i++) {
> +		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
> +			continue;
> +
> +		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
> +		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
> +	}
> +}
> +
>  static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
>  {
>  	int i, j;
> @@ -330,15 +343,7 @@ static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
>  
>  static void ath12k_pci_free_irq(struct ath12k_base *ab)
>  {
> -	int i, irq_idx;
> -
> -	for (i = 0; i < ab->hw_params->ce_count; i++) {
> -		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
> -			continue;
> -		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
> -		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
> -	}
> -
> +	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
>  	ath12k_pci_free_ext_irq(ab);
>  }
>  
> @@ -671,6 +676,8 @@ static int ath12k_pci_config_irq(struct ath12k_base *ab)
>  		if (ret) {
>  			ath12k_err(ab, "failed to request irq %d: %d\n",
>  				   irq_idx, ret);
> +
> +			ath12k_pci_free_ce_irq(ab, i);
>  			return ret;
>  		}
>  
> @@ -681,8 +688,10 @@ static int ath12k_pci_config_irq(struct ath12k_base *ab)
>  	}
>  
>  	ret = ath12k_pci_ext_irq_config(ab);
> -	if (ret)
> +	if (ret) {
> +		ath12k_pci_ce_irq_disable(ab, ab->hw_params->ce_count);

ath12k_pci_free_ce_irq() instead ?

>  		return ret;
> +	}
>  
>  	return 0;
>  }


