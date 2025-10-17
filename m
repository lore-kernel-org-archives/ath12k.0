Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47536CCD184
	for <ath12k@archiver.kernel.org>; Fri, 17 Oct 2025 04:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2GoAmRUXWOqDeKWbHxWz4SlkDTe5271EwJBTML8h5o=; b=NBX9CwFpTuNhGQm+5llM6g21Cn
	mZxO/WHv/IH6qkS1NAGSou3OPcrrSbUBlKbexq5t8b/QLA7jZQ0Q1zM56plZClwpICq2eIZFV3QV/
	B8KPxm12ctHyX3j3kPAuiVipFRmyJ5ls04l1a45H2fri+MuTMorne7dd2TPK7D/JNAXwgSSTCCqtp
	aH3VVAT6GTc/0czD0mnO1wu/S++lcEGOcvjeNal7W4cFl+MI7aFqemzm+TgZPqj2VzvieIaTTT7yA
	0Ld7YUB7p0iIJQutcbWSLifi98WPsaygrWGUiEKH/x0dhLw1v0HTXjDV/soG8zyo6aSigAixs+Cnt
	OzAZ/tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9cUr-00000006ZPv-0CrL;
	Fri, 17 Oct 2025 04:55:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9cUp-00000006ZPF-1Pfk
	for ath12k@lists.infradead.org;
	Fri, 17 Oct 2025 04:55:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLThu022287
	for <ath12k@lists.infradead.org>; Fri, 17 Oct 2025 04:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2GoAmRUXWOqDeKWbHxWz4SlkDTe5271EwJBTML8h5o=; b=mc9vaBHhRrovUvmQ
	776G29NC6Oz+jbX7L287c+pOBLMv/RCCymkr5veLkGPTN93wg5ZRadUBKAj6he4s
	20e3DLjJJfvo8xKpdAVceZUlJJiijc++k1ofo3xG5vtZQHOIJpFBek85PUNfc30P
	YGnXY/Ftvtr1y0p/vm6kueVk/P2ujyzQr3a55HSY9YdEpbHs86W77UgEx4OUaL4e
	3RDJPPZTim177LZfQjj1mOb3s+8vUPNTf8GUNvW56UcYWInmQk9yYzKv6M2e3nYl
	SYehxGnrGN4BA+UE7azA5Q+XNhBb1MQ4PMl6zIFBYJvFIxYjRjE8y8W3zG1DmpoA
	336nWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtftqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Oct 2025 04:55:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290cd61855eso6864635ad.1
        for <ath12k@lists.infradead.org>; Thu, 16 Oct 2025 21:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760676911; x=1761281711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2GoAmRUXWOqDeKWbHxWz4SlkDTe5271EwJBTML8h5o=;
        b=BegGHEu/sijj59xTYiqY+wuYKynkLQe/53MPYX2ZpSiaXGt8z8JmWnq2QGQTl7g6u4
         J2AHdctigxMkAWoee504WZQLdAG65ANquFME8qOObhKC11lDZGG+bmP6CRMnwg64N4M2
         3B9F7VJ1hlcPk5B+XP7DtWEtmZ3gAfKsHcgEf+6CHeBxpVSNdVpr0gMkMFa45PndhU1V
         dnj/qElXkn1G428eeQBZeVI23DUoI3YqOFtKZ0ogbFT4Ft7HAoO5UkEF7xqTe3kc0g6z
         hrZRvY4TPggizzQZXCfwumltrTC+IDZzav8UhLbcewSrOr59FvgggXdOMHVM1VcNrM2e
         mKYg==
X-Forwarded-Encrypted: i=1; AJvYcCWNZANxfiuQCbYFy/FxBGdy8XpP0bdqDD1of8dLIZO62+Z+B6ebTYbQxHNd2UYuDMKFhHR3X7Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6JqzTfo6li5A2fkxRwYnZDC0oDjELjZ9lhMUeKRwcOXg1O8CD
	akQ2zjdmRK2ri99kxSRLjgeDRLJ3NjxOXe4g/A2C8LQgd7U1OKWbHDFBB47G8259diPk3RIaqdY
	paHY2CNvCYp5AQtGzMs8llhhz8qTknSUjs5AIWG5h4yB2UOw0MAUdPLI3Vx0FL6RW
X-Gm-Gg: ASbGncuL7e/DgfiOmG8je6tJ/ptNxU/7t0AtrFM83re3UDYTfW/m12Jurspx2KG2Plp
	2MYQY74JzelQNsCe8hOVnYWiO2SdqKHCE3/82VTVxbb4N7DuYbMtTo1Jt516T8gkAu0/XdblZSZ
	3kpyrJDKNQ4VDfIlBmNBzVO30+BlG9DOckuiaExHQlXoV9I5UYnlNMfwnSSK0GFBBg/gM2+uRya
	9PP33Lr8/nsdWlB+XbAdMjbeNmCRazGfsOcCGUmQgBCeR+9gcLYVJl4WY/oWXSrr5L8KEx0yKR8
	2quR6c4sJKcycvh82U2s4JO87GbjrTJdtJUJ65HUO0OZAfBh3F+mJmIFkcCyFqUvMxwJ803PsZH
	RzXnDcjhkz3LkSylfM12UZNCjW13Da2J6IQeD+RU3YMXl
X-Received: by 2002:a17:902:d60d:b0:24a:a6c8:d6c4 with SMTP id d9443c01a7336-290c9cf0f1amr27985395ad.26.1760676910958;
        Thu, 16 Oct 2025 21:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8wmtkH/zXjtGl9tsOITQqDIS7+ABeAjviNaWDx6IWkS2pAFr4SP762G/+gjBxYnECa2W5nQ==
X-Received: by 2002:a17:902:d60d:b0:24a:a6c8:d6c4 with SMTP id d9443c01a7336-290c9cf0f1amr27985145ad.26.1760676910482;
        Thu, 16 Oct 2025 21:55:10 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099afdc02sm48554895ad.110.2025.10.16.21.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 21:55:10 -0700 (PDT)
Message-ID: <a752e890-b54f-b2e3-817f-7da1cafee86a@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 10:25:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: Add MODULE_FIRMWARE() entries
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20251003082955.11436-1-tiwai@suse.de>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251003082955.11436-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sZf1UsRqa0oA5ZMq2R4XxKCrVXuVDsFK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXzaVwO+41gbPO
 XOI8xUsBRbcvWyK68v0AIygNJnYEfpq++iVQz6mgA0vHsH/hiGdU/516fwZ2CqBydZl3exz2KyJ
 M0LEVpiFGFdmWNtYCeFl8oLtzaRaI41Ih28o6308cppGxd1k1Vs4WPSe81xqT4ntDiAB6oq0U5b
 AiS8B3A3Okqc2tn994hRJjcrBpauxxym4ekT01wTLDwq0Rh2fJ9IclvT8Iuk4VhYWaviO3vWWEK
 V68oS3dRtKWlvyNE37dRW0a3Rg/z5SvhQ0CD6+ZsExCmsolOicU2tpP/YyiubEA7dHSVO6bvfTl
 A3Y/7bqwEaVJaQ1jqxKcfVFTHrPSi5RzV3BDSpULmn6mnXdFqIYpHmwG02NcifzqCxlDszvfYKe
 dzj/728wljdcAMRtEB8sEuGvLeR4iw==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f1cc35 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2wKZT7uEXQSXzUSAk68A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: sZf1UsRqa0oA5ZMq2R4XxKCrVXuVDsFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_215519_497098_8A70DD01 
X-CRM114-Status: GOOD (  17.03  )
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



On 10/3/2025 1:59 PM, Takashi Iwai wrote:
> Some systems such as live-image or installer require the firmware
> information for each module declared by MODULE_FIRMWARE(), which is
> currently missing in ath12k driver.
> 
> For addressing it, this patch adds the MODULE_FIRMWARE() entries.
> Like ath11k driver, we can just put the currently used firmware
> entries for QCN9274 and WCN7850 with wildcards.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   drivers/net/wireless/ath/ath12k/pci.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index c729d5526c75..48161db6af57 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -1871,3 +1871,7 @@ void ath12k_pci_exit(void)
>   {
>   	pci_unregister_driver(&ath12k_pci_driver);
>   }
> +
> +/* firmware files */
> +MODULE_FIRMWARE(ATH12K_FW_DIR "/QCN9274/hw2.0/*");
> +MODULE_FIRMWARE(ATH12K_FW_DIR "/WCN7850/hw2.0/*");

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

