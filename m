Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8B6C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 03:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6UXAXxEYf1SyoIhABxkkWxNHAbHxvZk97YORSHe2A4=; b=rJOrli2E/49P7geb0U8Tijv3eG
	DkNJ+AXfmxqZa/ihE4wS1MO/+fRFWGp8kDUhbo54aKB5N4UcaThj3y4bF63hXtHtItxOeCHIq5uVQ
	dlCV7Rtya5U/lCUucCLHm9NhBr1d8Gq9IO5ll2Oo8VdTvLIdbINmO7dj6pPBX3KEJWylg69w4X+QE
	Jaq7NtEZAhMdGceiz6wbFrvvAFlR+2eTq5Y0G0TQ9LVJoiOF714B5K7p++bYibF4LEW/FPiFza99p
	uPclxg3K5YfKd3Df8TrM0s4ficmO20nY5CLxoPottWwT/UWrWceVotnIZ/yavcTRRAxbMskqoleRv
	ZhPRmhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7AY-000000081O1-3GnN;
	Mon, 13 Jul 2026 03:17:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7AW-000000081NW-2EWQ
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 03:17:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3A1Hl169599
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 03:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s6UXAXxEYf1SyoIhABxkkWxNHAbHxvZk97YORSHe2A4=; b=J/PMKQLhV3BuVb8b
	va4ch5GmkcEg+e2TB0QAD4eywnjCh9Q6EQcnCwzJpqDJk1JUuXeuH8DQdgWdGm3c
	EYJzeJlOal2S5pltkEPZGL7kcux6G0PdU1sqzAiuctUQN+uwqLsnqtgUTgZ1wR/y
	0XN1Rj7LqKfsOLL0EviHyyDr3YS8LgXF9z9rAF14oqLA3d6EmewEnu1DjRayMyGp
	RHJEpSNe4GvozV8NGuGpfPgET7dCUpQrBTHB89TfhAZA2fL8xFETaQnas8z8qipi
	WkkaWq9IHTqXzoGTQ3XhqGBt3wfXn1XpC3iZiCvdMX6hMS7ruBKUvzbzMj70UEYk
	pgIJdQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehm63m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 03:17:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so45948315ad.1
        for <ath12k@lists.infradead.org>; Sun, 12 Jul 2026 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783912638; x=1784517438; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6UXAXxEYf1SyoIhABxkkWxNHAbHxvZk97YORSHe2A4=;
        b=gtFGZpzzvM+AuewfufLlz1S4jHOmsOh2HbTwnwdPhRkCXDepnCsuUez30/BIUEW9wK
         n7BrkZDpqRuYO986ZASYZyB7UITHe96fH/vY03ysSr6EmLBpQUDkPvyTBYQ6/U2lQcV4
         QVzrqG4ju/JfKTrGr3cNixkujdOZD4x3B1kLyvUTqV3WmyPHA0DVxQY1sJ/DUkRprZby
         Lr3ZPaJbRHGZjDXgLjv3cEc8Gs/KkBU48+38WArX8yWT6Sl4gpKEYWdHRRlzJL5ktLdo
         bulnyaRoJaKvLyhKK79ZVaUWHw6AjtmvPIs5J73eblOg+nQc3qDuwvbjPjqA5PhnWdpN
         2oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783912638; x=1784517438;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s6UXAXxEYf1SyoIhABxkkWxNHAbHxvZk97YORSHe2A4=;
        b=IFQGQ34bPaKQvi9aisJ46vRIcmd+6G7UzSXwBQuT+oC63Vhz5OT/XIF2Hy8YCFxpk9
         zVErfPdQvUO/0JR3QCGAKvTDLqp4sgg8vqs7tjhhHqvoVu+OhcE54UyxsnIlN7geTew5
         NI9qYodKTaF34KoYoSlUIKx3xG4jkW1X0Doe6mv8nFMSaz4K4FwfYCy9rIHqIXX45pod
         lJihcIPwdjHnMrJaJRLWETc3YLfKex1edm48NQMHugkDHF0jHMgvbYm++JOTTCGeaQTU
         XA0BO6/nksc4hyPAwFrZtQ1P0B3aaT/g+jQfFXqmxiZWsBii2NszORji0iMWIgq7WexX
         EE1w==
X-Forwarded-Encrypted: i=1; AHgh+RoIhclwK8OhDx6fVVqHlCVaNBe++6m6/CSKfFU9s60HuJAHfXIJnBR+QtZLvwnjyFP1pIDhong=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy61743W/2G4gRhlGo3D2awyGssbEyrMPbcQFvDzefxo8+Y+M7Y
	iig5mGSFL4vefjBevevEN7J/KuSRzZEOadakAf61mbvDep1DuEgYKYLt8dzRSQ0rZWADISR42wj
	0mM3x2qaLdWUiGnzEpRVwuI9kQBe4oOGTnnX8PS7utKd0hUR+2OzA/eRrgf8719E6d7yLGkAwns
	U=
X-Gm-Gg: AfdE7cnkDD59LruLFoswnd4Po47x3ihLEDGFZn9RGCJpQQD6asXNptm1JvKWzD5Tsda
	FUNOvAgdKOFJbgj29fnr2lL0qf62HSs6FbxTqL1DiITOYsW2MtE0MLLEpduQxvIXOIW2v2/JLV8
	LrWt8pCRQm2OiTaplb1e+7Pjmuc9MeWNVxWfpyOlq6mbLmSXfdzJfkNEQxNfcp/91fL2TL6qX3Z
	zvKhavKpY2zwT1Jhudlnj2Ny0CZ4k4+g7xCP+7OPVPcxZtSjV2aH9OQQLUGTGJ3q5iXE1aCb9kl
	QrS0fy9GYK3lNQaFxVEhI7CGLkCjXw8+4CIE/B6/pz8odyFBJy9tRSjibvNqbBAPitLrEAqLH1n
	xUfCH9FYgKRrE9Z35NZdY3pse6QkxuALmTLpkb8I2noWjz6t19hckUshl6H9rzg9jTbwQ/w9O8V
	m1l5NPEL4=
X-Received: by 2002:a17:902:d2c7:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2ce8298a501mr112386135ad.30.1783912638371;
        Sun, 12 Jul 2026 20:17:18 -0700 (PDT)
X-Received: by 2002:a17:902:d2c7:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2ce8298a501mr112385915ad.30.1783912637929;
        Sun, 12 Jul 2026 20:17:17 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf7858sm92067285ad.23.2026.07.12.20.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 20:17:17 -0700 (PDT)
Message-ID: <8133bce1-2b7e-46fb-8989-f5946ff341a8@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:17:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: release QMI handle on late init failures
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260708100924.744386-1-lgs201920130244@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260708100924.744386-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAyOSBTYWx0ZWRfX172vkEGOk5FV
 jJ3NFuxI5PHNJWZsDQqt3RHkhDiDA/cWAvoMQVSPgTGiqsGPUfzi+UA0SwQatTCBH3yYYP4cluK
 KE4kfO1t/Nokjyn3pi4WLoReX0dm0IU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAyOSBTYWx0ZWRfXz+vxC49FhHio
 TttrLe6vbOdtSQUAeZr1b+FElsvrWLMDij4VAe8OaMfcZDl56/c6Y9Sbw3nxN8D3qGJHaxIcFKk
 dgRBax9f15NTylmZ6IfBtyZCyt+C33vMKikTOb5wZkY39E6etg5wnn0A/2rQETKsFcyHEOB+seC
 mA6H4VPIAhI159HNNaft5++S+25WyNcqFDSPM5ejRIoCSispdeJybhI5t7Dhd5xBGmxlID04fXU
 SgFKZ0chmZtSk8RG8yodbpWC/dvI06iqkcwiK1xhG62qXf2SUZ7SKjX7dRyHR6121s4YduLlAsh
 7BOw7IRZxXFYv5liUndraWNo9xCx+3dAyvWHwxZcRKCImqFrGZwho/BlvXkrEfgORNXKy3FGrha
 z/+2FwgNqn64ku77idCDHmS5v5e3q3DG70zdywRJ0WDGxW0slz1cGz5T1n9r9bJloesbGF/2lgR
 d7BtllRkkFgsk6JZfUw==
X-Proofpoint-GUID: l4qneYQLJVoKe1navUHuosxTjce-CBz8
X-Proofpoint-ORIG-GUID: l4qneYQLJVoKe1navUHuosxTjce-CBz8
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a5458bf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=BBdAH38HxtlORMPQ_CcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_201720_693683_D00DFCEB 
X-CRM114-Status: GOOD (  22.37  )
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



On 7/8/2026 6:09 PM, Guangshuo Li wrote:
> The change referenced by the Fixes tag makes hardware group creation
> skip the device whose ath12k_core_soc_create() failed, and only destroys
> devices that were created successfully before it.
> 
> That avoids releasing an uninitialized QMI handle when qmi_handle_init()
> fails, but it also means that ath12k_qmi_init_service() must clean up any
> resources it has already acquired before returning an error.
> 
> qmi_handle_init() can succeed before later initialization steps fail. If
> the QMI event workqueue allocation fails, or qmi_add_lookup() fails, the
> function returns an error without releasing the already initialized QMI
> handle. Since the failed device is now skipped by the hardware group
> rollback path, that handle is leaked.
> 
> Release the QMI handle on those late failure paths and clear ab->qmi.ab
> so the failed device is left in the same state as the qmi_handle_init()
> failure path.
> 
> Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index fd762b5d7bb5..31e9fa9a62be 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -4054,7 +4054,8 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
>  	ab->qmi.event_wq = alloc_ordered_workqueue("ath12k_qmi_driver_event", 0);
>  	if (!ab->qmi.event_wq) {
>  		ath12k_err(ab, "failed to allocate workqueue\n");
> -		return -EFAULT;
> +		ret = -EFAULT;
> +		goto err_release_qmi_handle;
>  	}
>  
>  	INIT_LIST_HEAD(&ab->qmi.event_list);
> @@ -4067,9 +4068,15 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
>  	if (ret < 0) {
>  		ath12k_warn(ab, "failed to add qmi lookup\n");
>  		destroy_workqueue(ab->qmi.event_wq);
> -		return ret;
> +		goto err_release_qmi_handle;
>  	}
>  
> +	return ret;
> +
> +err_release_qmi_handle:
> +	qmi_handle_release(&ab->qmi.handle);
> +	ab->qmi.ab = NULL;

should this be ?

	ab->qmi.handle = NULL;

> +
>  	return ret;
>  }
>  


