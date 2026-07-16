Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E108C44511
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 17:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eb0tsROvYgrJwXInWDRPGfgNwyHzgxiDdzvGFul31AA=; b=2hnwxwo6G0YrngpXWiKxvZoajD
	G2Gi4ymtV/uNatTPgkQRlMOOb0DSuqwhSzQXHFMEaoCsfYdKoazTLEziTyaWmcheGiqlOP8CQI0ZY
	qSzhOFK9sHUHLXRI5FXD1D00F0qeHIoQ6qBTCU3dOjmvO3Qbh/pSCf95bUjZDkTDw4cC++u4iSqiw
	W1YAjL7h2KDxJT1Oajv8f0Ch/x+hZslDemTTfDzgATTp0gSCCJ6vPrL8dMLmIbITEPT+0468kELYO
	VJAXH5N87lwmKlrD4i/I+0C920x8fUDVAAV5hvmPZFj/08/eOUTnwUzBGjgYacaoWRsm7BC1kgZgy
	bqxxf8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPdi-00000000EqU-1o6a;
	Thu, 16 Jul 2026 17:12:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPdf-00000000Epu-3TMU
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 17:12:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGStjm3387668
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 17:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eb0tsROvYgrJwXInWDRPGfgNwyHzgxiDdzvGFul31AA=; b=JwPyugTY4Q2zixX+
	JmZZ0qpPwOexrsQyczWnBtUKSzi6eKf35ZubXjrd9/XaL/AQzdhBPcHFT/PfiqoQ
	/9ODRBfDPBMTMPqOUI51ZZcrecvzdDDmSfZsWiOOqn88g7nT3TrMQFyAVP5wZlSO
	6aCJrfUZDrWyuV4xVRxCDt6B0W+HP7sTT2DgwmJgW4b9KNb+OhXUnVUl5jivzut7
	PH8R54/gb+PGBSopQPBIDDm/+o8KMNDUrI1veTxXYq4ksM73x18ylhIyhHmz57St
	JGZkwEhTEUbIPO2GgL19c8WQ9crYr4QHlgHObQRN6SDiiUZ4PtWNz26xaB3DNXQz
	5ztq2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wbqys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 17:12:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce14a21faso14501385ad.0
        for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784221964; x=1784826764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eb0tsROvYgrJwXInWDRPGfgNwyHzgxiDdzvGFul31AA=;
        b=SB+vG95cvlIvf5CUMKLj4tAR8q4+M8vd1HZtlrv8ZyqySn5PMbYFAEX8nBot+Kwec9
         9dLvH//CN8Xi0/Fgf7OYvQg92kmHZGxSh5J9NQoaBik3Q491nWwnOodzi/DjnwMMPpPf
         VKQxu8cUU5c5uOsRJk+28sDYIWez3RcDsCXOnRNT9E/UpY8yetw91RMmGU3SBYu2Q40p
         s/uiAcIq0y/ZLJSxW7wf1VDNfZJIKTnOnF3lHj2vDzR1XyatzKnNxT5brCjInmmIJBG9
         nMArkYlO/yPTIzylYSG7gwW40RsnCIqv79w9xBgKQzEucnML4o1oR48tvtoWmzm9zd2h
         AtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221964; x=1784826764;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eb0tsROvYgrJwXInWDRPGfgNwyHzgxiDdzvGFul31AA=;
        b=sRUehPtiOnWj2N4CuAVaPZZUTx6JfS/7JAvjAEciwRLF1s0144wCBX8BChhfVoVikT
         KQcVNZdLov/nanZNWjUZhNVpOl0xLK4w6e/Arv1wUsYWSm3uEijqEEep70KQgAxvempq
         s7Oh2+yra+w87dGyKa275s3Uy2X2wzkkWw5waXwibK/AkFxjNR3jBqJ/MQxC2o3Eqdbr
         PsIXWKvFGcjYRnK1wiCkpMYyIkwBSA39Yv+xqzQ38f5rESZY7NUOgC/4Di22Mylzmyyw
         K5HuxjoG7i/pqp2PLTWoOf/HzwIj59sMlkGJCAngsxpwYHqjJ6HI6Wgqxmg9EeX97EAs
         ssNA==
X-Forwarded-Encrypted: i=1; AHgh+RoRMbPC3WOFmUNVYSZD2ntwqLdbPxeQ9lMNl6SJz6JSIg+So4Z7Ux9nCag4UUstkPsv5ooym5E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMF1voYwOwJ9PgWtguBedmEb5aBhRkJS4Ndtn4uzy2tcadKUrY
	yw2SQZLOgYACuR8xT31UiC8YOStoEZoiHQkRgkRZtfIO/lhYIQ99HAcdOBk/Xz+s6vOfmZpRpRZ
	6zO64X5bIBVwL2l6vPcYJDzwqOkAun/azqQpB8kj5isLrZHc1lOF4OrfweIEHseCF
X-Gm-Gg: AfdE7ckAect/Vl4Vn8KjN6K4P1vKl1s/wjzunuOdoxrQ0iKb2obSbYyzGIMHUBP7dRL
	qQCbtIm3GD6fRTotUQkHf7cL2VmO7JXbxPcnfj4C8YtX7PfiAOT1RDNRfXujIH7qZkdB4v8ABX0
	xRssU+B6kW8YGG3LutXyJXsLv27D1RgKNtuN4HzY+NfSKm57NhPSQSxQBUUaPJaFi4imodCeKJy
	Um/qQHPSX/299LMr0XAqEfcEaSb9w0g+M8UHKx9a4aN1o8IHZX8Rvicc1z9SP1T/9r3FOsDZS/v
	pHgDfAb2DHc4/5vMvbJdFnn16ErnydjC6HVRjNBdTl8EMw5UkuJ7OngjSfHwRWNC3cBOyr0rvaF
	k3uCee3WL8+72fp+c63f2sfY3N6nDoXIbeCFdIjGabZgZ
X-Received: by 2002:a17:902:ffce:b0:2ca:de3:15d7 with SMTP id d9443c01a7336-2cf1f4baf45mr34071455ad.16.1784221964339;
        Thu, 16 Jul 2026 10:12:44 -0700 (PDT)
X-Received: by 2002:a17:902:ffce:b0:2ca:de3:15d7 with SMTP id d9443c01a7336-2cf1f4baf45mr34071225ad.16.1784221963901;
        Thu, 16 Jul 2026 10:12:43 -0700 (PDT)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4284a92sm10169934c88.4.2026.07.16.10.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:12:43 -0700 (PDT)
Message-ID: <305f65d9-4ae6-44aa-8107-5fe2fbeff2df@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 22:42:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix scan command endianness on big
 endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260703-fix-channel-list-copy-v2-1-372c39306d79@westermo.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260703-fix-channel-list-copy-v2-1-372c39306d79@westermo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a59110e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=pP303J5G7jxFF2sG2pYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: 7r2yuKIohcyTars87ZfH0GL1vKw7BlwY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX2EBzpPsw/dOL
 Dwh+mj0DS8ytlO6ueiTuRXfDH4jVQRgf6qShGhvNJCyGUdfjsr8+n2/1K+zKfn2r/mtrIFRRrBN
 B1LrzbbqDwvwjbfD0sFOP9vuQa4C9z0=
X-Proofpoint-ORIG-GUID: 7r2yuKIohcyTars87ZfH0GL1vKw7BlwY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX/O2FVREtcfU6
 1OgZstu+YASvTRcTaMDLuvxrWdOjNdS8wpG8TW0trJOgKyKhMjC2XE12hrACCUKg40tyjJOY5+r
 7TG384PvoovYH2g91Ehvy/d1KSBncxaQoAfW7ZZlNNr1Gm/N/r2D9YcDJq4aY6XDtODezZ2AbtV
 h3g/9jTsNPquiIMmMBQ0GryoQFQgox3zrOdsQBxU5Q5vUxHdvZ5rxSnLPagEMbSxCpDmzP77G3e
 iNCTOXjkJKAqnCaR9ZxeNVnFNcn/cCO1V7zm8os9Blbrn5LH/RnkWe65FxNrRRl1J5gEInYclka
 LOsYcNQQCJntuQRtLkF93NdDqQnIV4bsM7f/Ak3fAjGxy6Oe9nb5b4qjNVMa4pm4GOhSYsSdU7P
 +QSeTT6z8emZLwcMYXAeOV8eG94XCnRppl8NTCesKaBUL2yVpq6Gw31JdcSLO+ymesTeaW7JN/u
 dkuB2wnOM9ZvUXlSJ6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_101247_878340_811F7A6B 
X-CRM114-Status: GOOD (  10.76  )
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

On 7/3/2026 1:05 PM, Alexander Wilhelm wrote:
> ath12k_wmi_scan_req_arg stores scan parameters in CPU-native byte order,
> while ath12k_wmi_send_scan_start_cmd() writes them into a WMI command
> buffer whose contents must be in little-endian format. The existing code
> copies the channel list and writes s_ssid and hint_bssid related values to
> the command buffer without endian conversion. As a result, scan requests
> contain invalid parameters on big-endian systems and fail.
> 
> Convert the channel list as well as the s_ssid and hint_bssid related
> values to little-endian before writing them to the WMI command buffer. This
> preserves the existing behaviour on little-endian systems while fixing scan
> requests on big-endian architectures.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

