Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F97CD4F54
	for <ath12k@archiver.kernel.org>; Wed, 20 May 2026 02:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO24hNW6jY+HDC4ZQoE4FY38gPRkws0t23Gy7B4dY1Q=; b=mNrGJoZOD7pArk8Lpg2XVhEy33
	+yTane0WZdBgdFiXjB3fRwWQyabwzQRu5beapmkTDzWBOJyDcWD64NEgD93bYJV0czQcEbvJ0kUm/
	CkBV/GkEyAgPXlpLwM/H18n1sseJ7mV1JFZLeQBgrrE3U8cCh3WpKnOtbHJgu2gChnMEq7DnExpio
	48HUhTjfIKya8bbZMqK/90HYUKAZL7n78N0tKIFZuulpMyw/iHDCD3KSKHAVbNc0CN7+PWtyi1eu5
	AEs/qtIY2L2/NBjw+steeDKti+M3g3ucW0JHSbp6451wPOkVtS8qkvkjjaYfQ4+7gtZGJcXoqPyL9
	J5yFjKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWvD-00000003Kev-0eqH;
	Wed, 20 May 2026 02:44:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWvA-00000003KeP-3l70
	for ath12k@lists.infradead.org;
	Wed, 20 May 2026 02:44:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JLkv1n1725756
	for <ath12k@lists.infradead.org>; Wed, 20 May 2026 02:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gO24hNW6jY+HDC4ZQoE4FY38gPRkws0t23Gy7B4dY1Q=; b=H+KLXrFLVPDZ/4S8
	k6IDuz9iFFWt82u2SM7lKhUG3z/0+ZBeVGA85c2poFrmA0iOF1jzg5yBmuT6r26O
	Ov3dg0kW2AhUYtUDeHYeO1Ev223PNsP7QMxfpqDmcJSeqbZU4OMu3n56jIYf+GLn
	ehk5zjdU0V15O78YcQJdIfAoLvrbcYI0RYk5Uh/PXwU51uWusDh0we9168kQqbYw
	vjYlehBYCk7QRkUiPS6KwIipc4pFCQFBLZD8BWNCUX8f4ovsEYUAGEzTPMHRBkPy
	HByZdqtUAoTvwFTxJ3xmUhF9U2cwaNE6H/u2BUKrjmjCOGocOQX8IWjJDDVuOw8C
	3ZdG/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qjk6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 20 May 2026 02:44:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso9507079a91.3
        for <ath12k@lists.infradead.org>; Tue, 19 May 2026 19:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779245071; x=1779849871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gO24hNW6jY+HDC4ZQoE4FY38gPRkws0t23Gy7B4dY1Q=;
        b=LwrkfguK5oEx86vWn0CWAjoiBPbSFHejjdtEDsdlVFdKrdVpUaQWzcWvBeL4zjHsRp
         VtT3f0dHJ9DNH6cpNW6ke5gc2G5gUMffuBG8OK4fKFivK9vJRPGIM3frT+an8Ng1A2zu
         /oP7IIwtXAFJUcxORVu+uuD9YAPjRAPMpZgfFbimVAkRRG/iKMAuAecioi6s6scF/nF7
         J4qev82Pu/6f/ydVW/ZH0PoyKSSp+CuyhdDG+yobLQl74vdiGXimR4OIx1DMf94s4o8K
         4qvyv0v1zgc3cntU+O8/YfyerPFSp578csw1FiAe8NWQ8or9oGMA+2ZPsRCvMlBws/WG
         KtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779245071; x=1779849871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gO24hNW6jY+HDC4ZQoE4FY38gPRkws0t23Gy7B4dY1Q=;
        b=WDHuohk1iItqO0ihvAXqNC7XItSpWAo0VjCLCk/98+2oaEC69wOKRgVTdesr/4Q8P4
         BmLt870x3GiF45Appi5j+gcjV0/1Obp5ur6Nc3IyOTKZdvPxCywTekKvW5dd/AwpAZ3j
         OvR8Ofyc0ad62slWFh2wThPMZmXKbyepk0GVoPdBImCxnComKYBkNQGDwnrU6vLqOiRh
         xwMHm3SUHMHs6oiso35E6zIXiX6vDr1Z7ZWaSGKEZyz7Sh9cSqQo3LQEZmqR3XrabJEw
         cOn/ixBAqbgoU0vWubk1UpXSt2kufX8DoduDl3uWAvjXn/Gb3i9LgANR9SEyc0fLzhgm
         NECA==
X-Forwarded-Encrypted: i=1; AFNElJ+lPP8g2BSih7UItxQovPFR3Q02plLV2HMwLHV5uHWQ9eMWc5GIjXj87IjYKNcBHnvYljTYniE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzABW6/Cvv+ot6bf78IQkL1s15sa1SNlW6YlcULDaOGgWB4SgKT
	yASbE6n8sUjUPvBKG5kICZ4bN9LflKClQXEW7byZEtRTJ+SVx74fwscqw6cpFgXQdeqwS7OLh/t
	c3HEi03eUEAuSioeMaP1xfu6D7JF0cHrtkcwUoHiQmKI8wwDjC9phRc+I3uErTVO6
X-Gm-Gg: Acq92OHTmWHvvUnyVyCpg4R3pmFOp3N1Ra+nTA2DkxMD8WW7uueACOVldu53iZnNl7q
	M5jHNcfLiCpm/1hDc0dflDv8WwpMpzKvDkKZ/U11DZ4ghYpgLg5EIbW6YnnohDf4hTF9d8ze9oS
	cv2MU5mrtzCsj9xyfte/jlCG5EfqGqWqI4CavZEjsoe2bpA9UxFKF+tNC8P3FpFKqA/WvCbGrlz
	zTFUKc/OmOPb1Lw7NmRgnCdkXrQIhWqC0de9j2mFwD7FOQuFskY4lLbPqaZVB3SK1o7t7lTTtTx
	UbiVqedKLZLAaQ1XfXVPb1oOQyQmXkS3ah0sa4A7U5GYm+lMcvm2At5toe8t+Eb8rFF+HImPdz7
	2o6gm/TZbTi04oMNQqlmswPlddWFQLy74c8uzxz5T6RKM5vczYiaR0H5uJ9EGfZ+TCIIHktgQkG
	hR
X-Received: by 2002:a17:90b:2fc4:b0:367:bf59:6f99 with SMTP id 98e67ed59e1d1-36951cb8825mr22338379a91.26.1779245070927;
        Tue, 19 May 2026 19:44:30 -0700 (PDT)
X-Received: by 2002:a17:90b:2fc4:b0:367:bf59:6f99 with SMTP id 98e67ed59e1d1-36951cb8825mr22338353a91.26.1779245070430;
        Tue, 19 May 2026 19:44:30 -0700 (PDT)
Received: from [192.168.11.105] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695157d963sm14945756a91.6.2026.05.19.19.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 19:44:30 -0700 (PDT)
Message-ID: <96f916ac-5725-48f1-a25e-cb34a51bc54b@oss.qualcomm.com>
Date: Wed, 20 May 2026 08:14:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix error unwind on arch_init()
 failure in PCI probe
To: Ripan Deuri <ripan.deuri@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260519192815.3911324-1-ripan.deuri@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260519192815.3911324-1-ripan.deuri@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAyMyBTYWx0ZWRfXxh5IzHc8Z6Wd
 eK+r5eCuACZ5sYhxrWCWTGtIOgMiRvpfLPri4OZh6GlIXO8lDemmga4odSTwoVwzNXqtbhjsq6h
 H3diS/D+ofxGydsF+EiZNxOKMKwdlVxSLxDWHPKV/h7ZCFB7ei/Wqs+0HI8jf85vSoeujpx71BS
 JpwTN4aZvXUMbFo16S+vYH6rMRZPUb54xi9E8GShX2nayJfo3HYbyD72d1P9DbkQNlvOA2qZ3Q2
 hl1QY9soqFtgFLKP+86niFIpX1Oym9MNdPI1XSChQaWbUOkrQStqETPitQ4sueuow9l9GO3jTYl
 dx0tg2dlIU2yBca/w6OHqzRriY8bbXkrf4O32CRcVvSyF0ROBb17/0CVjImoDr5ULSAZgQfEt62
 385VS2OE/4TlP+yckMmLYAPfERicwoaE122EINsp5ueUcAOM3jXRsU0rAIH/TMi9ZFx6zDEk1wC
 oTJ9EOOmEm+1l+0eb+A==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d200f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hhaimfcYFxIno_I0_EEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: PgALdUbqUSMAmal0BCco40T4UjTmtaC-
X-Proofpoint-ORIG-GUID: PgALdUbqUSMAmal0BCco40T4UjTmtaC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_194432_950590_AA2C672E 
X-CRM114-Status: UNSURE (   9.77  )
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

On 5/20/2026 12:58 AM, Ripan Deuri wrote:
> From: Ripan Deuri <ripan.deuri@oss.qualcomm.com>
> 
> When arch_init() fails in ath12k_pci_probe(), the code jumps to
> err_pci_msi_free, leaking resources in teardown.
> 
> Redirect the failure path to err_free_irq so teardown matches the setup order.
> 
> Compile-tested only.
> 
> Fixes: 614c23e24ee8 ("wifi: ath12k: Support arch-specific DP device allocation")
> Signed-off-by: Ripan Deuri <ripan.deuri@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

