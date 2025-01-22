Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E9CC0218C
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 16:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGbqRWVfjeWOlmkECg3ADo7b9Ai3dFw3hjCLzyfU23s=; b=oXTX2vPTYPMlDyBXz7TiCO0026
	z0/lYP7HEPLU6HpxDizYwUQQ5DoYi6kCMHuAHgk06vHzZt7zpbKxgJUP9nQ2EiZf4RI92Cunh4cD2
	G5x1fkFd8vOK3vcc7rwBBZO8qzxeS9UlISJMD+53p4jtWu8adP8PsPl0J2JAiSBZA/5EZuSYjB4EW
	2PzOJyoytAQjV4YAH1fuFjO1R3ZPBcljVK6MrX2z/Um1qG85zs3ahdkVhB0+hk/5BuC9iLenvDSRJ
	Vr9VPrGFVLU04UqUnt1hb+oMR+EhFWUv9LSGiaUkudNYDL/RZrDp8/4+WsURVrUTwqaHw5g3wxYbS
	uZ+pDRrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tadcp-0000000AiGh-3D8I
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 16:30:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tadcn-0000000AiFp-1DFv
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 16:30:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MB7ftg000897
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 16:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGbqRWVfjeWOlmkECg3ADo7b9Ai3dFw3hjCLzyfU23s=; b=RG070ziDAE1gjeXT
	9FlTcjxOxkTxLqGd3LboEN3ByqeEwOL5Ue6C9mshkWnUPuFakNHgTs8Mac+Co5n2
	GtRnePj7YYjy23MIltelg0NuLXrDyx+/nc5pcxyjNKt01JimXO3GzgaIQuWQ4Tta
	deFH2ZUyDZy51jMWEAeJc6r97FlnoRd7+BlhoapyNxH8B5Pdi56ke+rMuJZ+opG9
	EhTUUxS3NBbe9ie/Gz+Bhfm0VKD/Jj9wVKomV9Y/NRWBGrjXOueSJj4CSIGhg0FX
	iykq+AtIX4nR1Q2t8xoa0kAkVqHx3ng8NywvDPjfnAI+GWH65rT4WI5VwPgZISDI
	vu0XSQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ayhcrqpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 16:30:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2165433e229so142068855ad.1
        for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 08:30:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737563440; x=1738168240;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGbqRWVfjeWOlmkECg3ADo7b9Ai3dFw3hjCLzyfU23s=;
        b=GR3CtP/yOJI6c1/1ytvtstso2GvtQY1WOpz5wNl6na1HNBqou24cKrrCOqJWh1/Axj
         cqDqyV/qhZYUumv7ZA0DATZjrHPfP/vrfljwAWer9QcEBuCV2BrDsLIvi87StgTYPeL9
         Wyj1J3/kujNMQzFRrHPpWi6NQeQ0sGz3j+uUQAMFXi08D2kJvbUGDpApGw5GiGHHj+IO
         QF3slpoXXpC4YYxliit/xhLolE+8ERELgKRRowFFjvGNI7beqAury1SDFIFbDNvZnCGK
         /Q1qQ6CxMwW+d762F6wln51h/PiAFKwIWUYBTkVhcpUuCjywL1yOpfFpl5XIZ0NRmKbq
         kcHQ==
X-Gm-Message-State: AOJu0YxVXOXEf8/73fx+cTgxq7U5Bd7qbzD9aVhE58wOUgxp2+h8fWSH
	K35Jw8cVr0HjWqe4J+u+VNmhJCA5bzf8riXR+Wo01HQrCLpkMaXvDVmdxn27AXdsgVJsZJi+zyq
	3hs5CnEn9io6PPgO0qvQlI6mBGjGbDeLsAGUZVGnYh9uER+jwWtaA8+FlT3Pi
X-Gm-Gg: ASbGncvBeK3e6ckfK3M7q2jDdDhLmIVYHxY/Jw6bE3fyyTkzCAJJ1npI2UoD2wXVg++
	joaaGDPKJYsPj6IR2VPnKapg78xoaRdwmOvtDhNgaSBwmYgJl1IS9yQg70asvHB14suSJvtVFE8
	HTr6VBWSPi908lfOGRN8UMfSnbz4ZZxUenPEoTqZIWdBzQO6ylTmtoYLkwxICfdd9kYou77E+VE
	nMYdtsaHdoGuWZTk0I9uCpA9XSRq24QMg7rGEujPCa809As4pd0dpNa0YTFf8REcJxh2YTm09XH
	k88jDikJMYGxxDilXOpcA7yYubT4IA==
X-Received: by 2002:a17:902:e80a:b0:216:6769:9ed7 with SMTP id d9443c01a7336-21c355c7dc2mr368167325ad.40.1737563439719;
        Wed, 22 Jan 2025 08:30:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECTYYoplVzBJ6wjKTC7k40I9OooX0AIs8FVPjZJ1CMDAfg1vLRLjHYKmiVXbGP9Crknvalkw==
X-Received: by 2002:a17:902:e80a:b0:216:6769:9ed7 with SMTP id d9443c01a7336-21c355c7dc2mr368166835ad.40.1737563439343;
        Wed, 22 Jan 2025 08:30:39 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d40273bsm98666785ad.213.2025.01.22.08.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 08:30:38 -0800 (PST)
Message-ID: <b6f99b64-3b11-4a4e-8995-fa18aa4ea203@oss.qualcomm.com>
Date: Wed, 22 Jan 2025 22:00:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix memory leak in ath12k_pci_remove()
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, kvalo@kernel.org,
        quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250122084756.817548-1-quic_miaoqing@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250122084756.817548-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WfFVFnmIVIJy4cXSnggVvX8PbXcPbLSJ
X-Proofpoint-ORIG-GUID: WfFVFnmIVIJy4cXSnggVvX8PbXcPbLSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_07,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=755 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_083041_352484_10C3B409 
X-CRM114-Status: UNSURE (   9.73  )
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

On 1/22/25 14:17, Miaoqing Pan wrote:
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -1725,6 +1725,7 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
>   	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
>   		ath12k_pci_power_down(ab, false);
>   		ath12k_qmi_deinit_service(ab);
> +		ath12k_fw_unmap(ab);
>   		ath12k_core_hw_group_unassign(ab);
>   		goto qmi_fail;
>   	}

Instead of this, why not move the "qmi_fail:" label above unmap() ?

-- 
Aditya

