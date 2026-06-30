Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F9CC43327
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+NN2NzpxKurBEiDtqX1Q065yz9/UoNGy13KR5P1bdE=; b=mqmBdM/dLOK2kKeMZ2v0Sd8msx
	Fp4cqUlun1fhwBL5vwL+dCkWtIFqlx7rdQyHjnbjVCNy0aw3e84Ad42hdS8rnyN+xYYYjHiehysyn
	Bk24C/c0yFT2tlP9efGnpr4wRcnTlVo0FcrjcmpPJh7DYbDhn1DE+6+/901ZPAuIN2UfMZjzXm9IB
	YTG68nVTHNWb8LdBvNQsxmzjitaIRsofeTKn6ZZTWXPLTyPvsBm0uhVtII9cZVLYi/EgxOk8dOYfX
	mWN42uuKKf1LVT2s+Pou8pXWdKHGpTMXjq51yRgdmN8liImDeRZoS4XTzYNFMsQGu4Qn3DndGFDqu
	Z9wF5MIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyg-00000000Eti-3ovZ;
	Tue, 30 Jun 2026 21:26:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyU-00000000En5-2w72
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDaCY2959907
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+NN2NzpxKurBEiDtqX1Q065yz9/UoNGy13KR5P1bdE=; b=bSoEye1jR+7EVMU6
	fVNcpZ7Ze79hC0KVGL1hR2NYZGZfb2QlFwqxTwnWieXbWsuMAyEBhB1I1uo+0s2m
	sIvIkWS3gvQo9cUAIlKSFRKLT8fSZJvyjUJgOVbn2JnSorHY40+zy0MkjyXe/gGW
	elIUwYpZWFj0EHL4fcE+YwGG/a6ikE7MKUElQ4KzzzFRUuTdRvVZwtJDN++VWxY4
	wGFcWwmLNJtsUVaU6c2ZT9MZ8QwlC9DcWY6g1RKswPiO65NZZxIamTOoYrYvbopm
	oKtXfDz85Q76oSMRVv3J6v3ShGXVX30qwBGlbbbkOP2XNr1HvN82LEYZ1avAJtHA
	CT2dxg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j91100x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c1f6c5559so244752eec.0
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854793; x=1783459593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+NN2NzpxKurBEiDtqX1Q065yz9/UoNGy13KR5P1bdE=;
        b=d2yvvn2WF05LvSN/kzmqSXE+BQsqm6IaOw5POCXdO8riXi1UPx8GIECNkmQ71rgCvQ
         fGdKC72akAqTA80nsX6B3ySsoc2SKfgXa9RHG/ayoIdqwQ3KNF//5BZfDN27t/2fLQ1D
         gp4wvF5uWX9ZWiBgpV3Qu3hgkZg+hZ1hv9sRtqpOQUtfS4Loa1SQmDpaqW3LZZl+tuHk
         0I9bi4RObRinVALnQ/0X5HyrUdg6TanK0cc+fddTkQlndFD3KipJhYoInwhiZprjBJo5
         bU+4WcY4ag3bAjuF/sDpjauBFGUahQteZ3E7b1oLXmHZqaiM5GVunqR5Riqfh0QSbIlQ
         HsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854793; x=1783459593;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4+NN2NzpxKurBEiDtqX1Q065yz9/UoNGy13KR5P1bdE=;
        b=JgONEQXTZWnOLabQsJrF7n+oKD2H5WdqEzXKRRG5mRIOCYZg0ELAdq6mNCJZjMVl7M
         Ap7SOBRhoUqPkYy+8s6Ud2jiNdZXy/uKgnDDIaUM+SaEPzdGz9lJhTbgAuvk+Q3XUlbk
         51819RuD3Qj+ubw6UQNSwbVEORSEgLNsUY68xYR3jREEVr3W/EeqLod18+7s+FSoKgbU
         U6aiCHXoYQMeAnfiBSfuMY9pDzF5XEkdSGvUN+1XU4KIeZvvhHk1EFo7n60f4YOgr5mK
         7Bv9cRXYidao7FM5C3viMePs362Rt21W8EVP8s1gZVQ1MjG9fgEwxMMUF1QNWXHAK0pM
         7K9Q==
X-Gm-Message-State: AOJu0YzmY+SZX3bXhfwwvmBDmgLWPtx0r/xvim0Fu/aGK7zGQlSZzjGZ
	wq/VtvBqbTteU4iktUeTS/02KatPNLfmKHIaNCX8El8SziSK56doglkvrVM8ZvptPcPv3GSQI9g
	hndBH7AjcRg0hfrdas+GMJnifl2Zsqh/SMrgAKEEQ3SPgy1fPZ7pwWphvgtJR0+qw
X-Gm-Gg: AfdE7cmI7U6xDn3et8WsZDHUJrQdd9F+4+D7vaqADKoVZwg0TpiUdTX/el8RDuIfd6Y
	3SChZ0JRcL77NCjBvi71K8rzXIMdmoqsAUODd+8txIXIlX5qp/3KX1I0Cin+bheHhJvq1xAR4j+
	OJUsMHXFf6eMJufRm8XZ+fqXuCb2CBH82YXQLkZJ2M2DYu4nVbsK8jRh8CIrY3d/XenWkS2zOh6
	geSqdcugnhENe8cQEdE+NHWU7Mc6RPkHykgt+yx7vX3rbgjTXjIhOfbfvsbOlueM6Z5rwlwLwRv
	rbHdFQKpYCcdLx45OS+WVVKMSCM2GpdChoGUAiHIqqcvD8PA+HA+oWVqWfp6G7qy7W1LDyToPGb
	l53qTP9ucUNH+rno6mCwKNipN9sNsFmGEEDOE1Le78CoA8I5XB2o2K2tw/hZ6waQujg==
X-Received: by 2002:a05:7300:730a:b0:30e:da28:ebf9 with SMTP id 5a478bee46e88-30ef0976056mr1966606eec.21.1782854793375;
        Tue, 30 Jun 2026 14:26:33 -0700 (PDT)
X-Received: by 2002:a05:7300:730a:b0:30e:da28:ebf9 with SMTP id 5a478bee46e88-30ef0976056mr1966590eec.21.1782854792829;
        Tue, 30 Jun 2026 14:26:32 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:30 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
In-Reply-To: <20260619120751.363340-1-aishwarya.r@oss.qualcomm.com>
References: <20260619120751.363340-1-aishwarya.r@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: reset REOQ LUT addresses before
 firmware stop
Message-Id: <178285478993.1590147.14177181473316715815.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: nloZgDseIIDj7LAl4GgEw_N55kV78j5e
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a44348a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CtJ01fMn697GwrxBsWEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: nloZgDseIIDj7LAl4GgEw_N55kV78j5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX7SC9foteDQL6
 PglpwcnSkCZ9DkZ6nVT4glKDYjD5K7zZNdYwWNfG1h2jcdYsy/73SnqjP8HPysWtx7AsxW2KDlx
 mOnIymEg63J0lUWgljCQnv22qq9xrZuhEx9ocg2omWedXbMUJIcusZpaBFmzzvq3/poLE4rtYzZ
 aLVUZFWe0CwmAyBiwyMF0jzO4iSaQNtziONdBQLbc7cUUYK0Ed/vMACLl7prWKxn7CNdoixpcjj
 YPEXwLE4hRLUI6OCkjHIl2bZPHZoj2k6wgXlD7PDfevYzyHKogMllARP12vZINgVC3REnzLbkY1
 M7pLHJ19PAn1VrphFj8SDqFGhDkO3bMZVziWd12/c8VUgVTdxP1fjCLz/lMe9AVcnH1HkUxPn1h
 i+YTn1oup4P3vjJucp1RoouuqFmdSuljdD6jPp2MrdZMqtjkY4XuVSP4mtROgIK/5TZbWLoc/P7
 JtvZrQJsVK4cI+avq6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfXwuVAzza45x4M
 qGuhH/KN0qS6kzcgVcu/J9xAmkQhRUkAQbu2N7/X0j/RToMaei+0obMcAw2BRmttKmkhCUPE2dw
 HRp+kEsrirFxEDvovg0PxHz3VOV7/Z8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142634_805146_D8C17C22 
X-CRM114-Status: UNSURE (   8.73  )
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


On Fri, 19 Jun 2026 17:37:51 +0530, Aishwarya R wrote:
> During module removal, REOQ LUT cleanup writes 0 to the REOQ/ML-REOQ
> LUT address registers. That cleanup runs from ath12k_core_stop(),
> after ath12k_qmi_firmware_stop() has already stopped the
> firmware (mode OFF), so the register writes can hit an invalid target
> access.
> 
> Move the REOQ LUT register reset before ath12k_qmi_firmware_stop(),
> so the registers are cleared before stopping the firmware,
> while register access is still valid.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: reset REOQ LUT addresses before firmware stop
      commit: fe2b006c15f6b1f81524b4c1af8013bc32fa0abc

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


