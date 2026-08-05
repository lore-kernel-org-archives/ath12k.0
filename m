Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727CBC55174
	for <ath12k@archiver.kernel.org>; Wed,  5 Aug 2026 17:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tf4LxB/oQgR5MpM2Vnd5nrnEbZ31FkI/3egS5tcFk4g=; b=OhSSA9FUVQ4BjsCbrmvBWJNOTb
	/2LQNykwHXyljSTcG59syPfmplbmfkcaGh/ZnG9WBQysCbe1TfsDK+I17cR/AYGmD98Cw+FFLNfUz
	dSM6hLsZkd5gxSdgvJCbND/a276WuG79inggELXmFNNxDhMdzGxi+dHbIKM2FAfqSdUEJcCP+p3u3
	3EP8pan0D4PdAQp4Jk57Lmekf6vxgaIya1oTDVS5JBXcof3iLj1fb+ga/cQuQxfC1WmTfP+LO3FyT
	kX3JiNo9RoE02128H+N47w5FZ7kK1FYL+EF+DtxDj2d6Jnxqkhr5JfPqDxMtEiQGrfmfRzP6d2WNt
	Uw6sUFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfZk-00000004LMK-47I9;
	Wed, 05 Aug 2026 17:38:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfZi-00000004LLp-2ynv
	for ath12k@lists.infradead.org;
	Wed, 05 Aug 2026 17:38:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HSDou3344214
	for <ath12k@lists.infradead.org>; Wed, 5 Aug 2026 17:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tf4LxB/oQgR5MpM2Vnd5nrnEbZ31FkI/3egS5tcFk4g=; b=knw85JFZGjWQz+v6
	PP068AmkKVCnDE6GdejKmCL5uSEyXSrrnM1s5IeFnWEoWEflkOwlbqQ2fl8B6Ca4
	9VJmy5IpC3V2cY6CeRwo2eF+Bq2CYfFAUvNp0EGmKQRsf2Dq4Rq78IL5NHA3xXsI
	Sh1qf2pO08Mgy7K5MQ1+iG9bTRFAbhid659OfkOsDeXyWMKkgLBZf/0sCtvhIz87
	MiugtG8gXvuDD5a7BdSJlPp3iRkrSGybv1WHBNSfE4TJEepLZS6NdiBHUzG+UOD/
	jeGt/UnHkMXfXlPay+xGR4ArzjKUvrHdApTTxhyhzdQnrBqAMqnjtvWFHvYbweok
	/YMF/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x9sa6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Aug 2026 17:38:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so2700390a91.2
        for <ath12k@lists.infradead.org>; Wed, 05 Aug 2026 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785951520; x=1786556320; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tf4LxB/oQgR5MpM2Vnd5nrnEbZ31FkI/3egS5tcFk4g=;
        b=EY2gk6NPEI5tPt1HqhU6hJVnvHaIFgycg7eaJK9JkrseoV0bSpm6IjQmj3dzZNxP+6
         AvCT8IeZZFVHR72LDiGkvzLSEX4H12/n30NIlCxkxsQ1j8iFve+DkQWvBbcdi+GS9ppq
         pZ811tEflM724xqgdE8BLocypesgROUlnDn2vfsJHWIqa+Syp9N45kJwHlLKoASV6AM9
         Jid2EO4d0kJYK652+PpO5Za7xbZDLYZGlSEV7OiOQfqH3UbKpeKzWdUYQ9eLvaYpEYfz
         DlPOQQs34n7IMP83g5RsZILUz35hYyVWXgu5f/RtWu2i6EP447U/e3nvdFeYka4WaANp
         OkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785951520; x=1786556320;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tf4LxB/oQgR5MpM2Vnd5nrnEbZ31FkI/3egS5tcFk4g=;
        b=gZwE9HbTADlpA80G9FPmDcvdbHEswqCIuhRWy73f/2lYhLdJabqwRHIa348OKg1Jao
         ldr5fa7jxZaDHjl7Mk1yRX+hxnTdMXW9hnurUevPQDCA/CTjCAupQldspvWFQ95H/sXZ
         k4Q3KNkKmCIDUrpDoq8JbUabMs1+2tvZmL+oehcvYeIddXT0d0qkrxlfxUjxl7b0yZcm
         Q3kwt6zv+zefLGSvInzFm2R9SsyD56ZZJJ5lTaF/UaMMaYJMV1EiRH8LKKpucwuw1HI2
         wBZE+4uoBe1RP9XcntjNPjTZEnX3Z7vi5pfcHz4xZ6Yq2/Zvr2yhzeNFvbWIbUB83VmE
         8kLg==
X-Forwarded-Encrypted: i=1; AHgh+RqOssLiqQUHNFFv3gaN2smDuk5wvavO1Wy/y6OFnAhAmb9NmfuBy5oO/GAUiA1+gYQExrVKxkM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi+Ws4kKafah4RQIAUzzEGbSySwx/LTYwV7E4XN1RYulpvJ6wu
	gCN9M+b9xz4mrbvoYqbElh1QAKB0f0owqG5m1aTABJNbSk8YWed/43cY9jMPnIFKf4+/EPphJyR
	RIaxXhWmv956ngUbtZgRmPFtmi13xxMqoWGF1bKE+fdUf/oQfFKDdZ0rJZRA3xtNReguwYsAj
X-Gm-Gg: AR+sD11ZX946qYDY4peqlm+SXrDEjAk6qZnGhv8cmtwc0DBC1XIYZgNl5f4MbMpJd/0
	yvUHwHtwFxAge6A+FRizwrC/AEDpQ2c2VG8Qhj/f+ePi9LZRUR34PVm1zQJXBflaBj/Wn9ZyQke
	uJtCwz0D2CGkxOp8fW1vsPchA5J+hQ4P1wyOVBrjh45M9Z/0jIpu4ue6u6yqhHbbnvbfRB6mQRn
	gCdPQzRjakOMwbLKWgH6MxnMJ6rBYFSokZ7s8a7wOpWVhiTUUAcBVysPI5wPXY+xb6Zec23xaXN
	pLtu6YQ4Gf/LFGohGFOe+KkJ/2oH+t3zd8GsWHEQXOKjWqD94LsOGEpeur2K/jD77PMOu6N+WKb
	Q3t+t5BW+RiPzdjo+wSKw48XTVbTWUAuLUsZ4waTZL53P
X-Received: by 2002:a17:90a:ec86:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-3903c537a12mr9388966a91.7.1785951035237;
        Wed, 05 Aug 2026 10:30:35 -0700 (PDT)
X-Received: by 2002:a17:90a:ec86:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-3903c537a12mr9388899a91.7.1785951034787;
        Wed, 05 Aug 2026 10:30:34 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca2e8ae2sm15689866c88.0.2026.08.05.10.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 10:30:34 -0700 (PDT)
Message-ID: <73d62ad2-439e-470d-a638-bb7c5a02f031@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 23:00:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/4] wifi: ath12k: fix timeout while waiting for
 regulatory update on bring-up
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE0NCBTYWx0ZWRfX//owTHYkpvsf
 TSWmidnxH8/cq17yDXlhbEDzurcd95tD06u3YskUGheHdhxOf5lsYIeQQHH92Xmn2Zscw/zEp0h
 1BruygqbpAgjcJ9IZjYks+n0fB1nEjjB+5IWeWwiCdqn1vZuTkw5fM47YhkgJL7PwiPSao6FMVK
 Vry+rYtQZTFpDzzCUbTPpYOjGZ9YPE/mwnA0lrdaNcEJs5knxV05mX3TLsXh2Z5X4Xy/VccVO0p
 qU1jHuiXKEnLQCHrDOcH8+2kvNKJJRh/of5DizxEaV7DdPx8MOVWHINWshP9ELQOixIDM8FvHx7
 diLDbGoalYv9ZCvOdHds0/VNKvUYtnOzEgIfS8GwBumeSlaerbpDqyQ3P9yk6ETHXvpyqOb27gL
 Uc9+7H+ShIG7mhFNlyovd/1rnhV07TMhoWnuYlICo2wC7FcpnsnWqqZAp1ToJP7LDzzH+7Z9i84
 IMXtTIopBXR7JuCrk0Q==
X-Proofpoint-ORIG-GUID: QMX0T03HspnmiqK48ZEGZvK1CbLTI2M1
X-Authority-Analysis: v=2.4 cv=BMqDalQG c=1 sm=1 tr=0 ts=6a737521 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dBmMSM3fNOV455FkuikA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: QMX0T03HspnmiqK48ZEGZvK1CbLTI2M1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE0NCBTYWx0ZWRfX9ywHalr6YVb5
 c2cnXiY2W167DqaoyNEPPwcKGvt986fgSQ5JeGwceW3CQv1n2tmQfrrfKPo7FRSYtTY8Geyg3yQ
 E/kdd9/lM2ZRbbzsEWQe2LMKEbUXyPI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_103842_870881_3C2703D2 
X-CRM114-Status: GOOD (  16.86  )
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

On 7/29/2026 12:48 PM, Baochen Qiang wrote:
> On devices that support setting the current country code, the following
> warning is seen during driver bring-up:
> 
>    Timeout while waiting for regulatory update
> 
> This happens when the country to be set during registration is the same as
> the one already applied at boot time: the regulatory event from firmware
> gets dropped without signalling the completion, so the waiter times out.
> 
> Fix it, and also skip setting the country code when it is unchanged.
> 
> ---
> Baochen Qiang (4):
>        wifi: ath12k: signal regd update completion when reg event is dropped
>        wifi: ath12k: use per-radio ab in ath12k_mac_hw_register()
>        wifi: ath12k: protect new_alpha2 access with base_lock
>        wifi: ath12k: skip setting country code during registration when unchanged
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 31 ++++++++++++++++++++++++++-----
>   drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++++--
>   2 files changed, 35 insertions(+), 7 deletions(-)
> ---
> base-commit: 4fa10e991f77b4c929d1959900a6ed422b9e2ac5
> change-id: 20260721-ath12k-regd-wait-timeout-6403498ae30b
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

