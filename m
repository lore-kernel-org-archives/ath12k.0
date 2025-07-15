Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E94C83F37
	for <ath12k@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk/I29S/oFEoqtLU3bTKX52ZMG1AMTJAoA9iVUvagVw=; b=H1TH0zGzzXjzjLrNswAt8u9Wap
	M7TOLlYH9C6HfArmCZINmSpUQp5slpD1mpU+mEmwqVOA8JCabtyINQENnKLQvOqvhXVmVy8xGMMNp
	DOsoNaipMqWuPAiltLIL+bELDNJs/5D98oFOsyB41qo2Wt7Qczq0k0881qBnXHmJOj/4znS0hRx9/
	rOS2JiIGYcwD7nycn8j05gmX+yht5L8N7CCCREdfzWZ02JINgC2btLlV+ZE6YxSuy8Cp0bjdpPZz7
	BobPSh14YTRh9xfGVcD/bbK69w5RRgAMbUQzl59rmA++Pw2qNTkAq1rPWZLvUtAUBWuPRhqLT3aJ5
	+Z76R8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBV-000000061TO-1IoQ;
	Tue, 15 Jul 2025 19:19:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiRu-00000005juM-0geI
	for ath12k@lists.infradead.org;
	Tue, 15 Jul 2025 16:24:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDSg9014577
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 16:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mk/I29S/oFEoqtLU3bTKX52ZMG1AMTJAoA9iVUvagVw=; b=Vt3ZOzzjjI9YESZF
	9kwbCMW2PbIlu7UHN+CuiykqkVaIenmbMbM1OEMnEO92Z8+yJxCK4Eo9YFthFKqu
	oeULqdP8JstMaGvtMN5EaOE/m4Rzrj555UQ/YiLYhvFjXc6Q5azUOQt1+T/lQPTG
	DzqvmcuSlv1Mtw2vrkKD9bVV+8eIwgZJvNmXFwtfPyQ/6gksiwJUTm+HOXTPLqVl
	gP/BTTY6V9BJRUwuSZ5CYXw0RTq8UZ/2AkUs4VVwzMWWtjbi/CJ8MkkC2T2dgZea
	NF5X+xXCFtyEV5GXE6E+5uM1XgtmvppIIW+6cWLsQsX4o+L8UbSKSM/OlaDvKxne
	QvbolA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyktaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 16:24:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748f13ef248so5318160b3a.3
        for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 09:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752596648; x=1753201448;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mk/I29S/oFEoqtLU3bTKX52ZMG1AMTJAoA9iVUvagVw=;
        b=OfVdc3GsU5hh0DvcS9DHQnkiL5lVdtyGoS5O8egZz4ON992kbKvi7PazwEVZ71GTSp
         KNGsbqquRIOew7plp5j8B402sG9DJ5fRoKciehtkbcjsr70uCc4Sb5/Z67eLpPn7LL6G
         qQUs2iRjJqE1S8zIVpQFOdwT7rVjuKsXS2lFxgczdDN12w8S9zXUAVWQ098QxwQhoaZd
         cK0c9HND5nk2Wv9C1lMHPD9WDejePGLjnCj7/PTlDJe7ijbN1nsYvvs/ivqeZOYBOtSe
         eJ5SI6/yVimhE/UAr9+wbCL6n/CLiDSH1MP3DrAk2PCfeNYqFFqSu1HVTN38MoszjkWg
         0zQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw7Ti14+0dulGnLVdjlQ9YhNmEeVoufXfz7rYnPURVL4i6SfEZVUIgTNsAJCmX34xcjrJeY6I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzrtlv0GpxyWyYAoHtLE2CkLjBK/KMvOcVd+7H6F5WO0bQBfFW
	0EMllcU3O/gxVuzQtzEIvdBLwwP9eMw7Cg3U4LnTPBHfNQqCtEiuMfmDCtYz5l7YwShGy3Wh/0w
	LDqH7ECW+IYxjqNK/ZPRg9WvfXWq5Fb/OEHxD29CgAS8/g0GQIIhHu3vIAKqp1dvFskQ7g65a
X-Gm-Gg: ASbGncv6H1dfOMLineeRB6xncvCXydNFN5tXE4iWa5tkky6jdfwDOQeXboBcAK6uqoz
	6LfpA7hDZJolm9gh05vL2oB8xTZpjuzdBJpRWyoFpLS0VWowM6UuR3aGpX42kmyab031NJNdRSU
	Y59c00i9DUnR9lVEGges2qiNBmp5btuO4pTPflU33c9LjqEI+IedAQzIu0fl2ZJBZ4X/u3ltdBy
	hvcmTNGl/Yxe8El+eA48hZEroWq/7OC9Lac6R2Sjv/9RZQXiE/uGDUds5Hszsuasw5tdQzPQJk1
	L1vD1So6ZG58wAFQWfEbN4SzupGORrBnbQ69rAaQFPOo/kHUmpG1DYWC/GKANRCLxdpA8UkoDFy
	g
X-Received: by 2002:a05:6a00:2d0f:b0:748:9d26:bb0a with SMTP id d2e1a72fcca58-74ee274ca3amr23360039b3a.18.1752596648474;
        Tue, 15 Jul 2025 09:24:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO5K/Ti2kibTcVezSPr/Btb6+QkxnAHpHBFdUk6OSkSLttpdbpfSEnYCz3S+XnOjsEPhkUyQ==
X-Received: by 2002:a05:6a00:2d0f:b0:748:9d26:bb0a with SMTP id d2e1a72fcca58-74ee274ca3amr23360011b3a.18.1752596647922;
        Tue, 15 Jul 2025 09:24:07 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b715sm12815373b3a.93.2025.07.15.09.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:24:06 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20250715-ath12k-unneed-semicolon-v1-1-9972fd4cef07@oss.qualcomm.com>
References: <20250715-ath12k-unneed-semicolon-v1-1-9972fd4cef07@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: remove unneeded semicolon in
 ath12k_mac_parse_tx_pwr_env()
Message-Id: <175259664635.3448282.2749790548342441986.b4-ty@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 09:24:06 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Exp9dFKgLXoblXAUSi5xVzrYLS7dV6iI
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687680a9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=J17AwlqV-Ij9UdG5oKoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE1MCBTYWx0ZWRfX26D3iXwOsm+8
 YlWo2TfLVHjEEdo25uzUXrMqd+4cP0LmaJ88GGyyPbjpTat6VgYazp7e2n95RMvexVgk8y5yiQl
 uamLXalWFHqQcLY1L9aoqhY6zN7plPtMl42uLCJ4+ttL6QWx9zI0tp+6hwENG8L8EyaCE1xOr59
 GLYANFXAaXvl0LR9T8O06/NZTqstqnMNZqsncQo6FAfPk62ciK1N80iZ8h3SBRY1I7WlGumuoqQ
 p6Ocvfs5cINKx2kyJtnYZjgBbQQDUx0qfiRSh33LFXQbvUY6tWYFaQjMZLi7fsWpjZyBLMIUQYQ
 8P0G3ua/IktwE8E9CHeWdSCzMSvjsbcQMmZGxh84uD4Yl5z49LHCjwEoenYTriYQ6lFADwNNGp4
 FOpxT0RzG+mO94dnJB5Yin5QCHMGFhMOoiZG5hQ1eb/yxKTDEQ/72yzyVeMgwhq/tV0PrQue
X-Proofpoint-GUID: Exp9dFKgLXoblXAUSi5xVzrYLS7dV6iI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=919
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_092410_211734_A581F8F2 
X-CRM114-Status: UNSURE (   8.30  )
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


On Tue, 15 Jul 2025 10:07:35 +0800, Baochen Qiang wrote:
> Kernel bot warns about this unneeded semicolon:
> 
> 	drivers/net/wireless/ath/ath12k/mac.c:9785:2-3: Unneeded semicolon
> 
> Remove it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove unneeded semicolon in ath12k_mac_parse_tx_pwr_env()
      commit: 8ac2a383d4ce9e6229494c2a36df876800e6750e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


