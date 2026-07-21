Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F52C44529
	for <ath12k@archiver.kernel.org>; Tue, 21 Jul 2026 07:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ntnjqm0Pf0kPnyvZ9KBXYZLnjPI7YDr962+n8joPkXY=; b=fa6HH89notvPjWID1cTN19SJdY
	DebhXfAKB5m9gfsKF3jXPJJ9UdpQljVvFnQReGmt3qcR7mK0+lhqDV/pcOhWmIy0iuur9wVQxjcHH
	6gcCuDfrpkAUSOEyG0qhjJSl+ZpQCzvpI+a2qqar2E6fqVsc2VeumjMB/XJqCndfHiddX8Lv1/Ev3
	qSW6pQEBrgg40zAF8Q0vNDPWnArenaiMrD0a1MyZnuqvwXqMpviHDcajIgJCVGodk51+Vb7Qga3qG
	5N6gCD7NPXVhHSfzLwEiumt7oiqjwo/I4sT0uaM/SOQGgRAmR1NTn1XJMy1cLPUZlCsMO9qtA0A78
	nKPPJFrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4x7-00000008edd-2bGr;
	Tue, 21 Jul 2026 07:31:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4x2-00000008edE-3D2M
	for ath12k@lists.infradead.org;
	Tue, 21 Jul 2026 07:31:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4Sr9L527381
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 07:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ntnjqm0Pf0kPnyvZ9KBXYZLnjPI7YDr962+n8joPkXY=; b=TZLZGgV65jkzgNKa
	5B3mWY0R5gwfb/dC8damsMJB+oPCLTESp63P6rVG1vuStaY1c89SuQNKsHweCANb
	z4/wpwbK8PXI769Ov/FK+68z+w2gutZf7LM1WhsKQ7+gmQXOUHUCENwhtWBQh1wW
	AZHaE56hDB7m6p6yKtUUBZpiQJXCnco8WtCAWA/ytbCyKinA/Zb7ZoutyKq19C6e
	nEgNzkQ1UphRfKBtFbAb5B1ilqRPsDYzbNQ0KSi/gWIltwkZQZqDfHSBjqFs2UAX
	Ir6s3hRwg2Z+lo51g11jtx4Z+66eEfTDSEWv3lZ6dWvQdoBjakz9DUOQkW8U8Z8v
	u/FPZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se0nmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 07:31:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee894b3d8so145125315ad.2
        for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 00:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784619098; x=1785223898; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ntnjqm0Pf0kPnyvZ9KBXYZLnjPI7YDr962+n8joPkXY=;
        b=ST5NNsntiY8lSO6d1TkoZP14dBWHE6p8tdDjMJlNicDPNeZuVMlDYg1uOGK1QfWt8Z
         sZsUb8o+DuQEsEGM+VvKRgIjfMsirI6gNXCmu+MW+NjlqTsozzXWL8U0ohX7I5s5L7rm
         LRY97a4Lgrsqy5xhxKbfKGkLu+oxyz1no5zfU5zBn4uQIbvjmGFnk/sq2/ifTZzyD0LW
         D/EPENEc8Owo6RuQlDery3IT25OoRiWOaGrn0ZZqSk/g1JApULUNn7XHQ3jpHi82joXd
         1lQB2VpESQhVGGxD9SQkGCE7yvvU5WuerlmpEOMrPZGCYjZOOlK13CCKATYMxU9SPokR
         wpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619098; x=1785223898;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ntnjqm0Pf0kPnyvZ9KBXYZLnjPI7YDr962+n8joPkXY=;
        b=hawryBm1z0xPPu3sjOfRqF2z+tvUkWNxwPsjo5KbQAxXpioP3t1qFhbXoH99qCTxcZ
         NjdoA0BJ/qE+JC+k5GfiqYKBJmGFF2w/CNKF+KDz7A4zupPMee9rFqCnL0e3xsgYbf4c
         hnwwpme2mouUNNNmeX789DRxiwATioh2F7Q3ZfoGJgPLvwB9maF5njTTDKC90LPa7l82
         RdoOrrZ4wpwmz5K+3pE6uQ3C+F0PhifPTt9zgH99MMiIxz49jvOV/ZSKS9i5rVu/kCwd
         ZpiyGZ8x7jsZkLcPd1tQ+Q7PCXk1+kovfOZeg3hXnI8yto4XqrE3l80gQ4ktA2sKtEGq
         qIYA==
X-Forwarded-Encrypted: i=1; AHgh+RqxXCO8cjU2K0NzJzeGZeBk8PYnG9/Mk4wgvUjfFXHwiYxjIKnGG0GbsFz1fodIMJ8SNukbov0=@lists.infradead.org
X-Gm-Message-State: AOJu0YywNDc/H+WnRqAIxb9KPRNRom+AYZHonRtuh7pK/mZuGpUXi/AD
	MYqftSPrK7UFsbroauwJD0bZFzJq6AkRJm8SQ30unPKzVDpJsw5H09QbJv1d4tKsCetO2QIlTmo
	LF99d2yBqSSLF8XR48a8sZQVw8TgJX4F27+zEoRD3axi+0RP3/krt12fxsKzoNeYJjIZ6N/sX
X-Gm-Gg: AR+sD11icZFJYoayVOXU6vIrREd7O53Gl9qC+pA6RqHjJ41G7kNlEbrQVMWWrXpGxXq
	7sxoHxQYRDZTiX+8xfKMkV+rIZyu7JAW9qp0nPyPrbHxNFvKxUTsf5lhebc9xPmYGvYFBQ25xT7
	2JfnH63oBTFcFGPX+KH9aRKcBVjIJVY+mTb4z85CPC/Vzif+5jbiOjD2Hs5a6PE98in8xqVdx6w
	SAjwr9q2+ShGceDsmoZsw+os2Ykl4Fkooqjqt1qwCRSn1IYPwhooRtvMpFpaVAVV12QApQL58eA
	jDPlvEfgU3/JtduFBqkiJjcxzIG6IiaLVV4M1qPy2wn/DdLe+9KFsbqldQ6pe/1wsid9yW6dumu
	k74OYxxSAyeLTCkeYnIfLlHUUeBTrs1XBcpdBFtf6/Oqa9gdVGFGulzKR68nQzL3TaenUdYFe
X-Received: by 2002:a17:902:ea03:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2cf34832689mr191088745ad.5.1784619097609;
        Tue, 21 Jul 2026 00:31:37 -0700 (PDT)
X-Received: by 2002:a17:902:ea03:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2cf34832689mr191088455ad.5.1784619097036;
        Tue, 21 Jul 2026 00:31:37 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf342e3a8esm71116085ad.0.2026.07.21.00.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 00:31:36 -0700 (PDT)
Message-ID: <2a297c38-4a55-486a-ac4f-898158d05599@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:31:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: restore country code during resume
To: Stian Knudsen <stian@pokerfj.es>, Jeff Johnson <jjohnson@kernel.org>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <df37460e-f8ba-4e11-b412-4aa8b17cd32e@oss.qualcomm.com>
 <20260720120913.100604-1-stian@pokerfj.es>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260720120913.100604-1-stian@pokerfj.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eLr5DT6gRaVosw0k38yW277PKouvqVsO
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f205a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-SOlkNUPErW3LcS7OYoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3NyBTYWx0ZWRfX7wQbYNgkeRDv
 lEejAyX4cBWoZDSMnOXq3fJcyqEDlkEoo0moNffZ9cB/wy7srBgo+3SgbLpW3YKezy6n3IMr5es
 4uA6+ZP9+4nftBhUSLdORuHhzimLHSQ=
X-Proofpoint-GUID: eLr5DT6gRaVosw0k38yW277PKouvqVsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3NyBTYWx0ZWRfX/DH7RsTnGabd
 o8dK/gI+VVZS/tuxeljuMESCywj4+mYAsU5NkYWPZqvujwtNabRRWuuPOGZFURfJVUzJBw+M86X
 3MKJqtE1WIqFr0kfLs7XsENltU1P90QF3S9Jf5ECUrXFccVU8sw6kVhEZvIrKbAyFRZVM7dzvCN
 HDIHJMlfAFbhmQSXGQvbOS58s1RtpKNnCsy0VyJ1fZwpu8z8C9Og8lcEja+bg+EfBce+pSAPGc9
 t07YpijVnXfC/5nXJFIyflJ+iVM+v0uD9cR2Gl97/BkYGMKjPsjvVJlBuC82oIULEGYtoQsF8t3
 zq26+CkYk4QmwwhYUBtPwdNECiGRA86qDcDXsslWqQqOq0HZs6+xEPjDel4ORnnysNxhNOQ+UMI
 hbVNxJ2VRh/3JxYtQoCggqHn9mjNv8E91OTXNnhu0NrAtFnq/j2pXG7zTST1zk7y9YUD1k+Slym
 AX7gcslOEUVM6LDDVdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_003141_332757_5B5A5C73 
X-CRM114-Status: GOOD (  26.27  )
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



On 7/20/2026 8:09 PM, Stian Knudsen wrote:
> The country code configured before suspend is lost after resume:
> the device is powered down in suspend_late and powered back up in
> resume_early, so firmware reboots with its default regulatory
> settings and the previously set country code is no longer applied.
> 
> On WCN7850 the firmware comes back in the world regulatory domain
> (country 00) and takes ~7 seconds to rediscover the country code
> from AP beacons, part of a ~16 second total delay before wifi
> reconnects after resume.
> 
> Restore it by resending WMI_SET_CURRENT_COUNTRY_CMDID during resume
> if a country code was set before suspend, i.e. when ar->alpha2 is
> valid. This follows the same approach as ath11k commit 7f0343b7b871
> ("wifi: ath11k: restore country code during resume").
> 
> Note that only single_pdev_only devices support suspend/resume (see
> ath12k_core_continue_suspend_resume()), so handling the first and
> only pdev is sufficient.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/-_iDJ_M5RrqACWB0qmtleg@pokerfj.es
> Signed-off-by: Stian Knudsen <stian@pokerfj.es>
> ---
> v2:
> - Add Fixes tag, per Baochen's review comment.
> - Link to v1: https://lore.kernel.org/r/20260717130254.36732-1-stian@pokerfj.es
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -197,6 +197,7 @@ EXPORT_SYMBOL(ath12k_core_resume_early);
> 
>  int ath12k_core_resume(struct ath12k_base *ab)
>  {
> +	struct ath12k *ar;
>  	long time_left;
>  	int ret;
> 
> @@ -211,6 +212,26 @@ int ath12k_core_resume(struct ath12k_base *ab)
>  		return -ETIMEDOUT;
>  	}
> 
> +	/* So far only single_pdev_only devices can reach here,

bad block comment, '/*' should be on the first line by itself

/*
 * comment start here
 *
 */

no need to respin for this, suppose Jeff can fix it.

> +	 * so it is valid to handle the first, and the only, pdev.
> +	 */
> +	ar = ab->pdevs[0].ar;
> +	if (ab->hw_params->current_cc_support &&
> +	    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
> +		struct wmi_set_current_country_arg arg = {};
> +
> +		memcpy(&arg.alpha2, ar->alpha2, 2);
> +
> +		reinit_completion(&ar->regd_update_completed);
> +
> +		ret = ath12k_wmi_send_set_current_country_cmd(ar, &arg);
> +		if (ret) {
> +			ath12k_warn(ab, "failed to set country code during resume: %d\n",
> +				    ret);
> +			return ret;
> +		}
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(ath12k_core_resume);
> --
> 2.50.0

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


