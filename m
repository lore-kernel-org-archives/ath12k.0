Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51646C02194
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6Fa1/5aBiWk2HfzzQZzJAz5jF/zmzA7utLWq1npJTA=; b=hPsI8/2d/1PFSaCTrBqvtrGDY2
	oL6597e85m08Nxpsdr2t6fx0hnVZpfKpyLy50kQ9+dn4Zwh4jlUBCQzBNc49gNBAf8/S7UNa0JrJy
	ThqJLtFb4MOaaEl01JcYzc1mWU+FojrCiom/EC7jXVABZeL+yyXZcnTWY1jaKC/cs7vPcvU5ZsksE
	x0lCUoDtqxHoCqxu5imP2ZQLWxS3cU21DeIlE28N5EvPlQuufmQZtdFKQ76toM2YzlTxDPh5A6lPA
	PSutJTUP6X9JtkDR3sOPAii8Nfjsk9E3ed3ej8/A8457vYHnTD3GSyFIcQBTkoemfICn/v0SZ5heN
	R+H8HUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYN2-00000009Hek-04j4
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 17:30:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYMz-00000009Hd7-1rqS
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 17:30:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UCogsQ002298
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 17:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6Fa1/5aBiWk2HfzzQZzJAz5jF/zmzA7utLWq1npJTA=; b=mDT43JF1KuiNtVPS
	yZd+VRxf/prCPKevFe/6ZIN8RIsCBy1/T1sRZN1xB3WrO8ixzPVPmVJUJ2H0KQ3w
	hdVou80bUiNhIcdQCIzLKkv+ggq7ctI9NPfiknLfzJIPtoSaJjIKkCzR+lrqcMoH
	02V/14TmnOQ965ABDguQUcrO4GrE8A1KuD7n0ix1QcLKimQcbr5HpSyos1ZwLZ0M
	6OTXvKE7dWPixle0cExSaJuru6iNdzZOZZQZbUQmuG6D6tBZoWESXBbydikZAK+7
	MEdir5mwSaMYgMPBEing/GFijmlBYOwfC6ypuvCzWzPzz+FRNgVi6MQ9CuJ0CMQj
	CWp+XQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g9sn0pgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 17:30:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2163a2a1ec2so35843505ad.1
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 09:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738258222; x=1738863022;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6Fa1/5aBiWk2HfzzQZzJAz5jF/zmzA7utLWq1npJTA=;
        b=L+w1MX1WxvuNnBn6X0Hsxo4WG5nLHwIIY53pmrs2kra65eMbPuSlxP9ARFd46WUsHa
         c6wS/LHKC5NXUpjBahGFM9s257zxe8b6ZEB71PZWz5v3BRFqCFwJECJMPtqMosBeYsom
         MRV3K8kbWHoQOcOZHQdt9Kc2ttaRd7bxqitKKrhJlCNFvLhka1eEwmfB9fYrBfoGtW8N
         afPWqBvbnOZLcWcayTpnt/wBbHwtlCDQbiKKOCcUF4cZEejmynAZSPHzyc2Encj6YOVB
         xrxnMZhvDqO+W3mXhrk7ewNCjhkl8N7p5j4EWTqIe62uXkfGkerMOP7DuuaYRNsNyGOi
         iugQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3tFNJaeUZVsPZfP5OBG79liJmog88DK7/4veWAT8rFO5KWEX8Tn5NagvWiMo+3o76xJBOyMk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8jsUzM5lJbhOEf131n862HxogYAVuOZhcE45NUYdnuAh06+RG
	nRW+g8+Pq47dTvcaOeV14atTCvP/V5icBleuKkxsX1f6eK57SvAixoPCfJmhV9YyCLkhbAj8dN0
	hjruU769tHmJzQZb3UDsvwx7pZF2gb/Es85brOAC0oFScKf45xRabOReXecF5
X-Gm-Gg: ASbGncs6vyYVIy6Uk5sNL7mVzB9SBdjptlCRbrH5tZS2bwaQVDsvgM7TgU5x11f1wYS
	3Ivar2cC99lPAsA9yEPDPBAn7kuxWAX0+q3J6dvRzfBteUlmEK8KhPd9QXejSne9hTSD9Iz1kPv
	fVk29Nrlb6kaRLswdnQuLE8VW2ia5onMG/EZPJZnlgfX9X71qqQ7j9oVLub6cKddlZjh3W+ysPc
	TQNE0vxLiZNVeCzECo1B/yVDFwxmf02XGjp/eexKnun1SpWpYq7UKP1P7uncNh5dCEik6ROhjnm
	L1TzPrIXvHJVzDsY63BpOCqZ6LBkrsj6+RplMgoLL/X3lh/ZM0cEmMoIBUQj6Q0vi5t9g7pIjA=
	=
X-Received: by 2002:a17:902:d48b:b0:215:385e:921c with SMTP id d9443c01a7336-21dd7e39d0emr115615685ad.51.1738258222157;
        Thu, 30 Jan 2025 09:30:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELaiH32awt6QGzr63yRUAiA8B5sIZqc9gY7P8Bsp7pqcQV/C7UcdET9yb1E1jIjNmL8+e4kQ==
X-Received: by 2002:a17:902:d48b:b0:215:385e:921c with SMTP id d9443c01a7336-21dd7e39d0emr115615015ad.51.1738258221437;
        Thu, 30 Jan 2025 09:30:21 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330305asm16366485ad.186.2025.01.30.09.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:30:21 -0800 (PST)
Message-ID: <bdfc31fa-bf09-4540-8a72-139c46cbc353@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 09:30:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix ath12k_hal_tx_cmd_ext_desc_setup()
 info1 override
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250127071306.1454699-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250127071306.1454699-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CExY9Ejey0m9KgL4qRAJ6pIYQ8MBMapb
X-Proofpoint-ORIG-GUID: CExY9Ejey0m9KgL4qRAJ6pIYQ8MBMapb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=923 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501300132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093025_531931_5B69D393 
X-CRM114-Status: UNSURE (   7.51  )
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

On 1/26/2025 11:13 PM, Nicolas Escande wrote:
> Since inception there is an obvious typo laying around in
> ath12k_hal_tx_cmd_ext_desc_setup(). Instead of intitializing + adding

WARNING:TYPO_SPELLING: 'intitializing' may be misspelled - perhaps 'initializing'?

I'll fix in the 'pending' branch


