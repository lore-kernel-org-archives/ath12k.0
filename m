Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E209C43327
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxGUWVh7XlY2oaLv4zshgCYnYU/gzVpwiXufl467KvU=; b=jTDzn0xD8qdeEwxOWfeizxbz3n
	NjUm9Rk72iMrNfnipJLPFA0bHiwNZbNyqm/nKd6lC0FOUQHqvRa0MoUJX9UAxPu29GjlnKqcRzTde
	xUS7C/ces8gfxBbmttopYR8kydaWvmInxGku50JX3hTzrxLmNiGwIRuGhN48uGlokL/pJa0AILUy2
	oQeVG0rdWOYQf0cHEMzJQSKCCYkahgOWM10AKBEzSR90LNR+4MkIrDNwQp8z+JMyf7IsBDO3YCMAS
	fZM2CGqCKdPpIu6+OEkNfDDZ0jkooOuISAeSqwBbXclLdMX3nKmkV3rTmk6vOnslZLzr8UUiEBac1
	ckrw+Wvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weshf-00000001OxH-3JC3;
	Wed, 01 Jul 2026 11:02:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weshd-00000001OwR-2EQ2
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 11:02:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Upa643999
	for <ath12k@lists.infradead.org>; Wed, 1 Jul 2026 11:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxGUWVh7XlY2oaLv4zshgCYnYU/gzVpwiXufl467KvU=; b=ElGUKYkeMmxIkgOz
	thIHzWjBi816QcqEqbreeIRMyIZU+6rVG+rebZE9G66w0v2luGay9FWAi2p11+1b
	WamPKZU6YNqu7ehEZvQLIGFOubMPljNHBV6TpY9kaACuypXi8Tws1YrI7JRqy8fv
	/6poc5jXITgCRmlN4UxleWMjee9AhxwgIFQia+bLF2p52rMPRZzlNMD0jtzleArO
	QPMnxD96dfuxWEZRWaUJJKBAiWutTS2hZg4RH8cER7WZY+ny5Mh/FPfQU0YASFbQ
	QLPI+AisWhheOktOthSyv7cWpKLU0IzeZfN9AUvYqC1zqfwKOtZAN14rBvDkutKP
	bTNfPA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4ebx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 11:02:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73761f92dd1so13684137.1
        for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903720; x=1783508520; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxGUWVh7XlY2oaLv4zshgCYnYU/gzVpwiXufl467KvU=;
        b=IzSMCk42OJVVfZgxGZzcD3nPeyUNpSvWz1KrHPggJi5AGzgKsAOKBTEtGY7w7zBhsM
         g51PC3PjJhoa9R1lQ0cOR+5jaPPzr6i8Nxqt88nC9jM2t3P3hVhPKxzr3J2neDCUd51W
         RH5SMHTdIioh+zTZu10rF0/ovddlhDefYMIYhsA+Tb927W1BDllR29HCXCVU4hPmNVx6
         EDTY903C53ulSbu/qBfQHEuTACgksgHLkFsW1EElgk4IFp0iUS39WHgq2D7OFMowQjmC
         HQPunXNxsCo9Htqink5vXzS/nxKbFOdIEsgekVQMxu58IVpxgjLEr2+5PdJthcdpz1zd
         SjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903720; x=1783508520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxGUWVh7XlY2oaLv4zshgCYnYU/gzVpwiXufl467KvU=;
        b=gutJXYP24bOMHyi/oUF2DB5QS6X160uM2MhYhfG8FNJ+9BKS44LgLpEvZmzs1Rtm7F
         lTCg68j1XxZWjyMnxUdifA5llqVhbcbDaZGaTy9oVs2v2zhBYoPzt5FvozxQoEajPpdI
         VJlIiQ8YCGL0PrkNrlEtTt5494J2WbTvFtYc+Oy2gI06pSubbKHnfngFS0VyUEa1xP+L
         sGqCPJiroIdWGPCszpGJCnnaSymldczGTLF2ODi1uoa/o7qRY/xPpgSa9hswi2/kPycx
         Aw7/XkucIdk37/yldaRB5vLrO/vfv3Jt8l5KLbykDVOQjf9ioS0FddNHx7lTPnmNvEEb
         jT0g==
X-Forwarded-Encrypted: i=1; AHgh+RpEDo+rNvzgPYZUeYQk01YMbv4Hh+BjqmlV2QZWbBAiGTlRJF+oO9Dxp2o2itproI8zUo3nfMI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYRoJb10OKWGksjtSqPbbdgDqCQpxXJPjjgnjdSHxnWhKd+OE1
	fQhAxoI68GPbbKYZNGQS4MWe7sIqAgtflFmmbV0p3rZLTVTWLVGwnJImd+Eq5b0uuF7s6mtKzrm
	YFHneJ209Oe6VRXu80K99Vo680nydWXBahngLfwuRzBP/dSmgCizCxGRYgn+IjMMb
X-Gm-Gg: AfdE7clpuF1r44FZ6nmu9VyUmrF65cAB86G7XZqKQr4X5uC3Kn8d6ext+VRXTv0xIkt
	rWXQ/eacZpYFI0onnRf4vlAm1v6ubj+tNmLUj49KdP1H+v3Nji3vB1w32mths1D3IVgR3vCXfhB
	Chgz278L4Eo/QWaKSnLT6S6yKXO2jhiiZxEjM/MR/GUuN+r9drhdRX4vH/75Oj0frPytTxXFjFT
	zDoolZyjDfuzD6J5OAFYlHt0KOAw0DOLTWkDEWP09DF7AhYuQNNNvEBuu7mR835a8DnDPtCAEy9
	W3me/Ai7MsRJVr5ptJvFPvIPGfcbSrWn/v2DmZrimtQzRClt300Oqj023SWkQuavTi+icAtSbFR
	mYZPVDpm11L69/mqDZxHnIDJLHqgwPGDVinc=
X-Received: by 2002:a05:6102:3e0b:b0:739:5c3d:605b with SMTP id ada2fe7eead31-73da8836a74mr86239137.1.1782903719639;
        Wed, 01 Jul 2026 04:01:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0b:b0:739:5c3d:605b with SMTP id ada2fe7eead31-73da8836a74mr86169137.1.1782903719140;
        Wed, 01 Jul 2026 04:01:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c128917536csm257546366b.56.2026.07.01.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:01:58 -0700 (PDT)
Message-ID: <c93b47af-e291-4a6a-ae4b-cc46f25c422b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/14] media: qcom: Pass proper PAS ID to
 set_remote_state API
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
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
 <20260626133440.692849-11-sumit.garg@kernel.org>
 <c251430d-2184-4ecc-8d05-9cb47533e5ec@oss.qualcomm.com>
 <akTFZgKBQYQUYxx4@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akTFZgKBQYQUYxx4@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXzZZeIgnuOOuY
 6gzMPkfW+/uM01hy9rhJhp4LkdNmLvFasSUlQ0hUO2Efp8c04uGgEJKic7zmU9lolDze57+8160
 8LyrcV0SDBLdqQgjnqAcCzestX+9WsA=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44f3a8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uyZSW4wqkseYk8rkHTIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: IeHpiLGF2w4dxuMDn9150sLHeKvhAmde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX8IzDTjM/EdGV
 1oiNosRR4Kze8DSPEbA+ZUBUdBYbgtjZJrWGmnS6Fa+DnJX+9ATU2K7TaruKKPRK788BXwQhadG
 s3ulFhnrejrQO7reYOf8JDDL5UNpR/yOUY+/eA9aZhVaJpp53x4Y1nHaEkDLtjzqweqyD6M7ryu
 7Z7JrG1BXdrAbMgnQEgjdlhpiqnf5i1Q+XTRtuSPNhS1ts5tUkb9rXp6U1OVK5GRdZJNiLrocrK
 QEYwhINwAzChiSC5cS/e3mPyHYaIlhqVEBmSgADcIhgB9FmmtiPgL35xlYFZYbfkqaVRiOzRibR
 UvtyA/clJMA1ZUUmmzroGoi9l9UrjTq8rKBvhHeZTZ0s4ahI6eWnXnyeYbeDrhyhlZZ8VHRwCIL
 zBMB/h1MaT73GJ111NLwdBXC0XzHL04dJZ9DI4VQlIIyuvAuEhjUwnpOMul12vKztiMfazfTDY0
 uplbKOUjglvXpmL9Mrg==
X-Proofpoint-GUID: IeHpiLGF2w4dxuMDn9150sLHeKvhAmde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_040201_578128_AD34ECF3 
X-CRM114-Status: GOOD (  22.96  )
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

On 7/1/26 9:44 AM, Sumit Garg wrote:
> On Tue, Jun 30, 2026 at 02:42:25PM +0200, Konrad Dybcio wrote:
>> On 6/26/26 3:34 PM, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> As per testing the SCM backend just ignores it while OP-TEE makes
>>> use of it to for proper book keeping purpose.
>>>
>>> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>>>  drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>>> index ea9654dd679e..d2e7ba4f37e3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
>>> @@ -110,5 +110,5 @@ int iris_fw_unload(struct iris_core *core)
>>>  
>>>  int iris_set_hw_state(struct iris_core *core, bool resume)
>>>  {
>>> -	return qcom_pas_set_remote_state(resume, 0);
>>> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>>>  }
>>> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
>>> index 3a38ff985822..3c0727ea137d 100644
>>> --- a/drivers/media/platform/qcom/venus/firmware.c
>>> +++ b/drivers/media/platform/qcom/venus/firmware.c
>>> @@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>>>  	int ret;
>>>  
>>>  	if (core->use_tz) {
>>> -		ret = qcom_pas_set_remote_state(resume, 0);
>>> +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);
>>
>> This should not be in the middle of a mildly related series..
>> The PAS IDs should be centralized into a single header. And the
>> name of the driver shouldn't be part of the define. I would guesstimate
>> that on the secure side it's probably called VPU or VIDEO
> 
> I agree with your comments, this is something I would also like to
> consolidate on OP-TEE side as well: see discussion here [1].
> 
> However, the patch itself was needed to do book keeping on OP-TEE side
> but I can drop it since anyhow the video isn't functional yet in
> upstream dependent on the proper IOMMU support.

For this patch.. I think QCTZ may be ignoring the argument so it
may not matter.. on a second thought you already have it reviewed
and it's already a cross-subsys merge so might as well pull it in,
worst case scenario it'll revert cleanly

Once this lands, please move all PAS defines to.. hmm.. qcom_pas.h
sounds like a good candidate?

Konrad

