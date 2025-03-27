Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E35C3600B
	for <ath12k@archiver.kernel.org>; Thu, 27 Mar 2025 22:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwsNi8QsOReXFcb1FbJciF9gTf46FOalgcDSlPmHHGs=; b=bFQIXoaVt+HOAIJla+0evTAdun
	UtYgZEo2uWT0Z38cBNOaFVdzpUgyHmKCBgN/dW7IG8U5FGhBjteUkPjL5Mb91R1cRDAAFlexvHsRq
	XPoiMWJbBU6Sf7Hbei1DPMDW6J57Ze7cvAj/d3kLpRNfx6N0mQHdfK5Jk69YE8WXBCJ8vDEhLudpk
	bvjz/6VP6fc+vIagWC3uV6s2ZZXBC0pW3bKsAGK+Sv0u+TzidKiWMyc7WVyuqt7MP2LeP3DKUYx4E
	BZoP0I1GB/0Wj0XM8Mutr7NxD58hVNWHRK9xdsZGS2lGix6r4W6zQ6XMJgUmdqrXZSkS6mPfBQ1Ke
	dudDxWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwBa-0000000CBq0-1auA
	for ath12k@archiver.kernel.org;
	Thu, 27 Mar 2025 22:58:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwBX-0000000CBpF-3qXe
	for ath12k@lists.infradead.org;
	Thu, 27 Mar 2025 22:58:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RFILAl013761
	for <ath12k@lists.infradead.org>; Thu, 27 Mar 2025 22:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwsNi8QsOReXFcb1FbJciF9gTf46FOalgcDSlPmHHGs=; b=D29Dehio0Or9/daN
	6+5Tk6E8plpTqElygAyZMXsDqenWWv+dBAvkgP5i8DJh0i639jV24WJfmzdrcMT+
	GqmseLflBL1YuLZrfK0RBy4agXZbC4zuXn1NLPe8MlWMneNsV0xZUX5ZnU/tP3dy
	sUllqXhTntO7MAd2CdA5LTYlbfJRhOP4XLQ261clL1Nqs1BpOYYHfPXM+FyMsDzb
	DqMpe6qg9R7y7Yz73ZRppYBMLxtWGxYZqjQbin7QJL/s1WExb25IOJo0ErLbMunV
	VGKRHmED2Lii14tTaV1PxUFl+1A1Klb6gmDHC88HUikw3a8lViAmNJeeb7NlPWw/
	NlqKPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcnfn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 27 Mar 2025 22:58:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2242f3fd213so24914845ad.1
        for <ath12k@lists.infradead.org>; Thu, 27 Mar 2025 15:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743116329; x=1743721129;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwsNi8QsOReXFcb1FbJciF9gTf46FOalgcDSlPmHHGs=;
        b=A0CRQlAkPPkP+rRsPOxDwjIMxFW8CU4xEFtEBtbqneIydMvFKPg9rQr4HxN8H/r+d0
         X2Y4jRxQzp7N2E33m4Izs7ea7s9vXVSKODdYzxtbRhHsrbWZNZKOObpQWu9abY8HjKiI
         mTloNpSxEPDlo1+G+Jo0dUp8mcDRDAuC2L8slkoc1oOlb2mBPOskpkJPjXalvybQCb9p
         Ve9+YtCdSZJP8oPTNfCNU7tIF6FHuSpZxM/l57fG8NxfDtaHur3WjCF8deUrw3CUMInu
         kM1RXEYnyLF3JjPulZdTNu6br234OfTCw3zMba3gWajg5a7ixPDjuP9CSEeGeuqtXBI3
         evGg==
X-Forwarded-Encrypted: i=1; AJvYcCVGS3QUQqkMahRNNBNSTHBInXIKyw40ZffXGDuji1G7+011ykTazYcN95Ch8Y7WrWFNilCZ73Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YyM+xW6BC1IiEl2JSRjHcJ1+k+XoxHSvIJCAo/ProM+vcErwVug
	DpBMyFCnfCDSwAQwAB2xTbkbWMMVViO58JJcdDm/TEfPepTWhCf6GRaCj8yK3UuBexQIPPafzfp
	pyVznEoBIxCMmUhciA7cUDWEs/3hKonBXe4vJnsdYc/cMHkzkSGEZBlVlpG4K
X-Gm-Gg: ASbGnctzOfy1q4EJRfOoj5gd9wXoOXftK6GxV3MIYN6MattXspbIUj2EN/wmq41F/Rt
	8fkq5mHa99L8PgDuNYcXN6kKRFuBe+tdUoSWDIkXkHfn7DbA8RdwqGUYgox99wf9ZrjrrdB9E5M
	2IRUsVpLqOwzM65kVNIIpDoi879zGmmjiem/I0FEyrEbCzotk5Z3kfE74JMfYLcTn1HdBtDdnvn
	RlGu/WRTx8khaRxuI/90JzuB9SH9CBmACxnImuMO0iPJ+63gt79DtgnGgY/5DBUkaTQIbWRN0GM
	VISEw8DVLTMgJs9C+F55VTSxcxXm/ktwysE9f0rxQeDGf7y6vN4/
X-Received: by 2002:a17:902:e74d:b0:215:9bc2:42ec with SMTP id d9443c01a7336-228049593d4mr63194785ad.47.1743116328903;
        Thu, 27 Mar 2025 15:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo3llEhAshCJigTArwJsK8MdUEo1K8YaG3xciPsGH7ORmvx1slvNw9CWL1ccqzjL2yn7l9wA==
X-Received: by 2002:a17:902:e74d:b0:215:9bc2:42ec with SMTP id d9443c01a7336-228049593d4mr63194545ad.47.1743116328414;
        Thu, 27 Mar 2025 15:58:48 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec7bb9sm5442425ad.6.2025.03.27.15.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:58:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250321162331.19507-1-johan+linaro@kernel.org>
References: <20250321162331.19507-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
Message-Id: <174311632770.448522.14375483509145513378.b4-ty@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 15:58:47 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e5d82a cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=NqV8gX1W2k58nkAEOZ0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: W4e05a5fJPViWEVGsOn_UsIA5fyrnkoe
X-Proofpoint-ORIG-GUID: W4e05a5fJPViWEVGsOn_UsIA5fyrnkoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=693 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_155852_092061_A3686F5F 
X-CRM114-Status: UNSURE (   9.30  )
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


On Fri, 21 Mar 2025 17:23:31 +0100, Johan Hovold wrote:
> Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
> without an iommu (under OS control) similar to what was done for ath11k
> in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
> DMA").
> 
> This specifically avoids using bounce buffers on Qualcomm Snapdragon X
> Elite machines like the Lenovo ThinkPad T14s when running at EL1.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: extend dma mask to 36 bits
      commit: 79ce49513222a89338e78bc7c7cb4a0fb4d6cb23

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


