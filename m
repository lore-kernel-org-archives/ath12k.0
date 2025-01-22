Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4510C02181
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 16:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v+bEFk1ICZblmKW/sZaG3nJ5WzJr94iOz+HstkL5bg=; b=GbkS4sZEYOsiARin14s3eXE4Gx
	fTqqOk33HU1yu2pwBXaUUX2dZkNvEfVjB/MRYvd/OzKlPb6lmndmdTeMt/06hoFsRgdJR9QgSWk+I
	3IJa0CbM0NA/b+C/Db5vTssVujztqWqqtvIFGOqlDxnfghkOWIMiQhlBz/6Cw+GOfjdwUXsq2BcdS
	NxHy4jvVIa4PD5StWLVa1upbFzisOrZvs/9FYjlCvuaOGBkMSdmYI3PlGP3FuMAZPzBN+Z22jFIVg
	l2hGaHA8EHDVAGKPUN7RfD1k9OB6268sn00qtt0k7qasP0SlK43ovZZGdQdXjFZ/rTZk/Pyz3MRIQ
	4ViHbHUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tads4-0000000Akwl-2VNY
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 16:46:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tads2-0000000AkwM-04gq
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 16:46:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MAlv56018815
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 16:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7v+bEFk1ICZblmKW/sZaG3nJ5WzJr94iOz+HstkL5bg=; b=Xbs9CnyzzyS/ciz0
	AoyC3lMA3cGyXWWyGIhvmr+QTut1NZNCZFLPHCLmmO94UE1qNQR1REqdrJLFhUn/
	hM88j9hDXdp1L3UBNNXFZxM46fFnQj+APgmBaQMlhYYb0qczw0IMVQVAIOydXEsR
	+jgZBN6yuY9za/bAMKIMHQ2OOKqvvNbiBISru3jUdBw8qfwaxiqld5Ng+0P4HOVv
	o+BapLdtq0UT3TQQSTQeAseaHC0rj2Ol+0bQTMUrYdx3HzHAvygx/OEn9lgBHO/+
	u5XN2+U2IWIIvsj5jaKIC029Ifyz7t4QfKqXpw9/xOuaNEgNfmdWNX0R2HjZwOR5
	vpSNVw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ay80rtuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 16:46:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21661949f23so207792855ad.3
        for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 08:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564383; x=1738169183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7v+bEFk1ICZblmKW/sZaG3nJ5WzJr94iOz+HstkL5bg=;
        b=VL6ZGSayknL01T45Yp6AiiYK7ooUvSBdsWnOUPxG5Pb3b4doEsXy5nmtK5DX642BJM
         0x1o+eu1PCw+YPoUuwtNxeHn5OmDWp76n3DckK4tpE2UDeqDEXwhf+ZoCiiTRDXrjG7o
         JmYH6PN/XoJ+dYhQ1oZytpMkbNunYvv9HMvzLOgl/04E/ibAOQI4xotMHSMJVIvhq8/h
         Bpmzgw/P3WsfXF8aMr9Qhqj0MFsQb7Z6uZWJm/Avxhxv56Zj9ovP6rWnu52P5HB/vkwV
         j2n8FgxBzcV2xUAIX+rzFaFx58lIK7QkkrdzRwp1hsJ+5ELMwYOkjOsCVnxhKfopsla7
         Dl9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwSQhniACQa0tJV4Vhi+EAihIJqLwOdJuHCjgN8TxjmODoa54OxSkDtTevD8/2yvgfwmDxqn0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/GFr+Fnme9/kBN8T4ig5pYT08yCh0SazyMpizuVGX4Dl1rayA
	l6odyMNi1jQs5Pp9m4FmrsKLtFQBSlWGu/4bOA/0r7MDfFt77OGlz6QxOHfBlaC8n29rzMGr+QS
	JrNAgkOtDJP5oTtORDsNo8IlZGGLn/2VgmD9cCC7MaMD+WtLMenfhKgjwAA6V
X-Gm-Gg: ASbGncuRSJ5fwz3m9vdlGRM0GaIvAU25ebQ/YZUdC/l9W8oNGRZiNNkSMUdfUthE3yc
	11pWGKHD74q96Eea86B2c6vNRtkpIpdMT85WqSyJGeODRSaO3HDOUxv6tj/24F6Xct+NZLKQFtK
	IIaGEQ2mRVD7eD4lx1tIPAZs/CZUdqfrFZzODw0ltZuc2v2heGX5X/hUqNpJaY2A4ZqD87ddSi/
	JV9jf2ZMnJaNVutcQTcToUuHUkRR4pQ+c3Kwo35G7OMom6JeL2RUX8xbC6ci6uuDFM6/u/SfQha
	9Kr3Q1YosG6ff+Lk4XJ7lpK7tVsNWA==
X-Received: by 2002:a17:902:d2cb:b0:215:b74c:d7ad with SMTP id d9443c01a7336-21c356307e6mr345524035ad.36.1737564383500;
        Wed, 22 Jan 2025 08:46:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnU64udupAVVoRUnYBL4fK+FwmbcgZ+CvYqXuySY8jX6GWUUERwVhakwXz27rfrIGpdPUe4g==
X-Received: by 2002:a17:902:d2cb:b0:215:b74c:d7ad with SMTP id d9443c01a7336-21c356307e6mr345523705ad.36.1737564383127;
        Wed, 22 Jan 2025 08:46:23 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ce9efd6sm97200435ad.23.2025.01.22.08.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 08:46:22 -0800 (PST)
Message-ID: <101c0824-1c0d-4e5f-bb4c-7d6ef65f1698@oss.qualcomm.com>
Date: Wed, 22 Jan 2025 22:16:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix skb_ext_desc leak in ath12k_dp_tx error
 path
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250122160112.3234558-1-nico.escande@gmail.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250122160112.3234558-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lFr0FtlaDc3V2lClB25_6ZsHSyjXB9KA
X-Proofpoint-ORIG-GUID: lFr0FtlaDc3V2lClB25_6ZsHSyjXB9KA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_07,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=922
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_084626_176922_5792D6B6 
X-CRM114-Status: GOOD (  10.71  )
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

On 1/22/25 21:31, Nicolas Escande wrote:
> When vlan support was added, we missed that when
> ath12k_dp_prepare_htt_metadata returns an error we also need to free the

nit: Always refer function name with () for clarity.

> skb holding the metadata before going on with the cleanup process.
> Compile tested only.
> 
> Fixes: 26dd8ccdba4d ("wifi: ath12k: dynamic VLAN support")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---

If there's going to be a new version please take care of above nit 
comment. Otherwise -

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


-- 
Aditya

