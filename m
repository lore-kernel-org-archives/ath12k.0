Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B16BC531D0
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 02:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dfeu4PiLTHOP46s0cp6yzqgG0LolKcw3ZEXTPQR4oxA=; b=X6NbHQjwQetqldCqW1oSscCp0P
	0YpNaBt/XVOQEYQYwDQB6UxcFFoItuZhzFoY3xSQWzFBJ8NsKnPzjJxF1bUPJVUdL9d3u/70cEdR7
	8dOBtK7klmDBoiepb3dEnclSFdQCfNtGANSgY+7DAGeMFtdkBjFEBA776R4cQ7+XjZ4qTkJpeL41N
	cNrpeUwElMMZTJ8XXgdivFG0XLmEOn80mPJDWKUXXexr6XsRBWJg0jDbGXeHnZT5xbYZ/fYbidhUS
	fAh+EHPcxGy1nWrE5FReiKHTRHwKthaCjGygZaWFaYpYoRxNnYLOrQ4NFco3nGP3AElAXXO1teN/Z
	ohMZqsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn60u-0000000FPKY-2eSR;
	Fri, 24 Jul 2026 02:51:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn60r-0000000FPK8-49u3
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 02:51:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O2i7Ex1240803
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 02:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dfeu4PiLTHOP46s0cp6yzqgG0LolKcw3ZEXTPQR4oxA=; b=LmmsTV24G5eFiOAE
	QATax2/Wnoni3AWK4efRowB+e9icQzu1v4hmBUAWiaj+zMHAybbhGpdZjmJ9qrvE
	32GQaXcv4bLn81ohewT8c2DGQZJAL+O9x1av4sg0sVTF2ZJK+a9ReLM7ixYq0pPP
	0kXrw0RPHP2fm38vW8bT+zJRHz0R3OFngmVElygMiRHvhMoqlsBtYJZEPWNJPiuR
	ZdSZNG+2hIauJreNQYW5Q8aZB8SnTMLcGazzuFFnLlK1iP0UTn4qtl0I7S5/aSF9
	ehcRl6RWF8jYSHin/3fTJtbUtrIpaAQWras7X/DJ9DUptRqRihAPn0ucPH60AveG
	C75Kjg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrrn8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 02:51:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so2628566a91.1
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 19:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784861507; x=1785466307; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dfeu4PiLTHOP46s0cp6yzqgG0LolKcw3ZEXTPQR4oxA=;
        b=Czm3MdeajOITVzSWpMAcgqibmbrkliy1lWFKd98ppmVuGhXvazBolkHXO28S5N76aK
         XNoLjPLHb1Ff3D3pjxAKRYOwtiE+zvhJaPSWWR/cbpFVDJm8NNFn643Fq/XFfE/i1JFt
         uV1llWs0zdX1CKqcp212O05jkD9P1ZZDjZt5UI2GDa+Mux9ShauvCzPvUYVn29z3W3aW
         1PvMl9axkZFsws6kmAyzPYnLrtqeGtuB43sE9ugGfck5r+NnYZ9FeHKqpn7XxLpWKkTQ
         YLOC71OojNaV/AJzadldsefqSuerrv7phjsBH98JvbaJ32ivUZBL9HIXeXIEq888789I
         cFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784861507; x=1785466307;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dfeu4PiLTHOP46s0cp6yzqgG0LolKcw3ZEXTPQR4oxA=;
        b=U6lUHImunBinwH0bNs8MglIJyhjA9FCWvVR+HM7wmuwInb5s3UocQl/4xK0oCYEVdz
         AfUZZq6TG6IxzfsZmVKsE6dk/Ik4CAGBbJ3S5HxmHvyqYCBZ+jrmwYndK0yKoJnCLMQe
         hkuF30SnP15B18YQv1FWS7MMbq1rBZZzEa0IlwWFyObBIT9t4tsacI8RS7fcQskymofr
         +kHHw/1dirxf2SG2xEnNI/RPmHeh8BNba9uieIdK/K3cGygGzL1InsuhN/KUPsdId4nA
         q/o4lN+B206cFK66jesu5tWA/aOvslQLQBOWOaGx9c1gdibz0vkd14HjOeOhVJB8LE3p
         MMEw==
X-Forwarded-Encrypted: i=1; AHgh+Rpr4HTYNkT+PQZJP2agFd5gmhror91J915jUDF+5qCjpP+ox/r0qeZkILaCiy4qd4ZJ4fdmEf0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqt6pI4iqCIRf7trueJGe1YsYr+/3Swwi3BKALHCFWAvN0UyMR
	eW3C0nJmJ5FaqBbGCeHrg38Eewfsqy+AAVO0V4J+DZxMAr+3VNDa/rNlEmjqwkaoEK+Y2VndPnu
	embZgf036n99n9qkgkAPmARLHLwtdVEkeVRPcRDL74y/mTpOotiIeOyDLsuK5sKvz
X-Gm-Gg: AR+sD11K/8NOPN+3fxrCiiYlw2itFCK/2d08t3/FdzUilhoV29utU1qKuMUH8M5Iior
	M/KHtveJVKQysvbQzMcQ7xX/3hDfBtXRk5MIpZiX/xLFxxEeEi+I0o/tBBOOP8Mowhokb/P2MmB
	WTEda54xy939oaANHxsE+SRt7VHelTkKjNBfwOnSl1X2+NcJoaff/K+To/Oe/qlVTePs9lBVbMg
	Vg/zvNNT0vAxxONfw/9Aczrs9xYumppFajruvQAOqN6pB9VT+L/y8Ufip2sbYkmebaEXNZfjzq8
	2iZR2kquT+g4DVV5EQgh0GhBWnR40Bz1HYRB03bK/x2mLOzaFfVW5/u/zO2y1/rsVeXkVGVa2wN
	6CYF6+vs4ZRCyXLuXjq5MT4s4I5ghFpLKOfS4HJXXn7EdSyojAiHVrrTznQzu6SX8ne48Ya0v
X-Received: by 2002:a17:90b:2d10:b0:380:9504:9780 with SMTP id 98e67ed59e1d1-38ec6631fe3mr5645244a91.29.1784861507404;
        Thu, 23 Jul 2026 19:51:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2d10:b0:380:9504:9780 with SMTP id 98e67ed59e1d1-38ec6631fe3mr5645222a91.29.1784861506940;
        Thu, 23 Jul 2026 19:51:46 -0700 (PDT)
Received: from [10.133.33.45] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03aed0f0sm700164a91.8.2026.07.23.19.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 19:51:46 -0700 (PDT)
Message-ID: <36d63752-0d93-412c-96c8-546c972e6b7b@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:51:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: restore country code during resume
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Stian Knudsen <stian@pokerfj.es>, Jeff Johnson <jjohnson@kernel.org>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <df37460e-f8ba-4e11-b412-4aa8b17cd32e@oss.qualcomm.com>
 <20260720120913.100604-1-stian@pokerfj.es>
 <bacea060-bae5-4136-841c-49db5b561b51@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bacea060-bae5-4136-841c-49db5b561b51@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAyNCBTYWx0ZWRfXylgpKoFbpWiU
 zPORSU9ahA/e0ASh5+r3K8ENRYcd6AGDYCA4f3CNXp7Yv/Xx0WxhOeU7G0LrDF0o57YXU/QDqm4
 lWNesDJJsIWxmZVqT7GiJpxA3ktnNVk=
X-Proofpoint-ORIG-GUID: 11uVNIxu2nTCnopaVthfgXlsZO1pzot4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAyNCBTYWx0ZWRfX9IepuBQVuXx8
 Wkg52EAQTbvH/TmbG/oofoWE51t+lUwuSxLZj7i67h3kBCAlflohJ/zBdVOLcT5TyIENLZAR2iw
 gYYCL2KAM7WnBbWzh2rcpqzb+pISR9YzjQ20F+rk3DA346AxmDURTj2ek3fPkuqa9EVMf/YX0Lj
 G6Xdr/wUA/CgffqxTH7F7lM9E1l7Uo8XG+UAdk2oBDwjbobVRQCtVlhQjFZrxDH6ct9l5rTK64+
 wcrdfyyxIqbNP4+ZBTrkKk4DbXNgIJt2aCnNHif+7yI4GFRE+Tjo/7LHX7vzMNosDpkpbs5sI1H
 e2IXyDnFMPy5Z2IBFXW51G7bBnRJ3gttC88gKaaUYG1sVWsY/qtWNm8UMB+t5cTKxlW8JVdrUup
 6+7JlRJBceCQAF/8JIEoTLaOryTE8m+Uq25D8Y9Yj2pLb2oXL5lviN1BfnaiY5Enf2xPsX4AIfT
 nwrBJRLifRhOI7ySrgw==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a62d344 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8lpEDrwlwfmWvIhY3bAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 11uVNIxu2nTCnopaVthfgXlsZO1pzot4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_195150_075370_8E4B7EE5 
X-CRM114-Status: GOOD (  26.32  )
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



On 7/24/2026 8:15 AM, Jeff Johnson wrote:
> On 7/20/2026 5:09 AM, Stian Knudsen wrote:
>> The country code configured before suspend is lost after resume:
>> the device is powered down in suspend_late and powered back up in
>> resume_early, so firmware reboots with its default regulatory
>> settings and the previously set country code is no longer applied.
>>
>> On WCN7850 the firmware comes back in the world regulatory domain
>> (country 00) and takes ~7 seconds to rediscover the country code
>> from AP beacons, part of a ~16 second total delay before wifi
>> reconnects after resume.
>>
>> Restore it by resending WMI_SET_CURRENT_COUNTRY_CMDID during resume
>> if a country code was set before suspend, i.e. when ar->alpha2 is
>> valid. This follows the same approach as ath11k commit 7f0343b7b871
>> ("wifi: ath11k: restore country code during resume").
>>
>> Note that only single_pdev_only devices support suspend/resume (see
>> ath12k_core_continue_suspend_resume()), so handling the first and
>> only pdev is sufficient.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>
>> Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
>> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>> Link: https://lore.kernel.org/r/-_iDJ_M5RrqACWB0qmtleg@pokerfj.es
>> Signed-off-by: Stian Knudsen <stian@pokerfj.es>
>> ---
>> v2:
>> - Add Fixes tag, per Baochen's review comment.
>> - Link to v1: https://lore.kernel.org/r/20260717130254.36732-1-stian@pokerfj.es
>> ---
>>  drivers/net/wireless/ath/ath12k/core.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -197,6 +197,7 @@ EXPORT_SYMBOL(ath12k_core_resume_early);
>>
>>  int ath12k_core_resume(struct ath12k_base *ab)
>>  {
>> +	struct ath12k *ar;
>>  	long time_left;
>>  	int ret;
>>
>> @@ -211,6 +212,26 @@ int ath12k_core_resume(struct ath12k_base *ab)
>>  		return -ETIMEDOUT;
>>  	}
>>
>> +	/* So far only single_pdev_only devices can reach here,
>> +	 * so it is valid to handle the first, and the only, pdev.
>> +	 */
>> +	ar = ab->pdevs[0].ar;
>> +	if (ab->hw_params->current_cc_support &&
>> +	    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
>> +		struct wmi_set_current_country_arg arg = {};
>> +
>> +		memcpy(&arg.alpha2, ar->alpha2, 2);
>> +
>> +		reinit_completion(&ar->regd_update_completed);
>> +
>> +		ret = ath12k_wmi_send_set_current_country_cmd(ar, &arg);
>> +		if (ret) {
>> +			ath12k_warn(ab, "failed to set country code during resume: %d\n",
>> +				    ret);
>> +			return ret;
>> +		}
> 
> Baochen, can you remind me why we don't need to wait for completion here?
> (the ath11k change doesn't wait)

Technically we will wait, but asynchronously instead of synchronously. It works in a way:

1. reinit completion
2. send new cc to firmware, proceed with no sync wait.
3. in reg channel list event host process reg rules, queue regd update work and signals
completion.
4. regd update work calls ath12k_regd_update() where we wait for the completion.

But I am feeling this is not a good design. As you can see, ath12k_regd_update() is
reachable via the regd update work, which is queued in reg chan list event. However it is
the event itself signals the completion. That means ath12k_regd_update() never blocks, the
whole reinit-wait thing is a no-ops.

> 
> If that is legit, perhaps we should document it with a comment since
> reinit_completion() without waiting for it seems strange
> 
>> +	}
>> +
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL(ath12k_core_resume);
>> --
>> 2.50.0
> 


