Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFE4C36017
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 18:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0zMaEUcmCblYUXxd78oWrLnsixQpLbuObDJggjybQLg=; b=YdZNA45cKZ39Jsqcc/8E1viqo8
	Is3wB9ZkL6++fkZHR7Hf4zwfMHHnyqs9qRcjlwrvneRUasWsogD7u9LAW4tTIBepVDfngUhLxAUKA
	1zacwvXMkbMkrQ26jWpZqenXTQRBBkdTngjWzgRC7hJp5h8YFVh63zO5dNZd34kAEvqVH0E77KPhM
	3+nSX5U9iiB7SlX6/ef2RjjPtnLFTjBKqs4xaAU+mtA5Uz7hG8ykqt8tpVO5c2xACvwdwjeJvRKVe
	8IeTtSSEZrIw8q4VXXdAI9sWYuT+oNYQshcDu1yYoygxQBhD4nhqZZNIpQoDx0DD94Ubxaxv+USVa
	n0WwIbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02qD-00000006v7j-1Fu5
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 18:29:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02qA-00000006v6x-3in4
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 18:29:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532ATCjg032704
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 18:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0zMaEUcmCblYUXxd78oWrLnsixQpLbuObDJ
	ggjybQLg=; b=StLywDKKjy54lwvSuUnzdJL/CErnrye1Wp90xeucyJEyPEiGQfR
	XSLRO58P3DcDkq7WuEfKSRE2oENhJutjMdnYmNhQ+RptRbllD5NysjrqZpoDT+j7
	XjZdSNvfjv/znyAgj+/J9CBk85Wji1NccfLu9vX1aAxgDhQ+0sOKpG3357h8W3r9
	2u9qLd1vTYaYqYaoFkdOKYvkx9fZSoepi0E5dEOkgeGbOr80BPHVlrxKqoRnWal6
	CXE6RBmaf/dPZMpLwtjVcxX1CEv6TCi24W8bBEv6g5RdZnuGQteewAzBVxB0oFh+
	na5EEbThcN+wbBoH9+07eer+pdxMhCsTJ0w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qmpmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 18:29:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2255ae39f8fso19053455ad.0
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 11:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743618568; x=1744223368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zMaEUcmCblYUXxd78oWrLnsixQpLbuObDJggjybQLg=;
        b=d24VvfZ/gBvCJGq4VVF/tvP4OGVPhsxdQuRijOor8JKYr+RqOVAruDCj6VKW8VygV2
         5xBN8CQZPwLA9sTjlTO5khMIF1lmRc4zEZjgqItxWFu9CLBFvrHariQr1UJ4dm0zZmyu
         ZeKFC7TMoP16+mTLBkpimc9OnVeNkp1rlfEQyjV5ZWR6kb+1Vo51MEVTDKSSDjYvgxy4
         JNv7x6IzqPIKeyQ7VCDZEDTblndN9asICAlRq3BqLpqZz8kN1xhNsSdo8QTSYtf9zqhW
         B9uo25trstovELnVS/PJ8Bcx5XfrSwJJKdHhMDXJrdq7umc8oMxabjFFSa8vMI0igyYk
         AfqA==
X-Gm-Message-State: AOJu0Yx/Q/eOq4SOkDVP07xBU0hX8wcEinlhZqUpaIZWbBVo7AaBpNt7
	ccFu3IjN4POcnN4J7eMOijIk2LJa8ukDVfW0ko6LbFHcTx6A19u5y1c7Llx4kckpq5JgBrQbdAj
	APDlZp4MF1akWFWspfpUmHwR++ZqKmAM20hsxzv6DsXFTlJuhx6Xipcl+Plb98w2aBXzf
X-Gm-Gg: ASbGncv0EUpO3jqJgKZOFcaFRrT74vKI0oRQ4nbB7r0vb4ghAYivytWaMG7+2q+AT9T
	BqOscR0jDFKUXGiHB1C79CVKFrtguadpX0vDo7Jy6nNLxz23lstScbObxQzWwmoYo/xSoubpg5t
	OMNpc8UhO/TPtNOEPvoV9o9yWWePLytHCypOhsbudJXdifss6yJmkIge+rutnZVH9RbqgzrCOX7
	twNFLnHQVUmrMXIAlTBtWiQzKOduvoKusMEW/xQYJpHkMVKH++TMBNd/EI9pSGQv64DMR7SzrGw
	N+TesUE1y/YU+Bek9xLLKvEaS2ssAaV30Gz7WnVJCRhtwP9SablxYFGqONnVqE7CJe95yldWEab
	tu5CUiaS3vFUNjE51A5eZjpl/m1JWXbg/ng==
X-Received: by 2002:a17:903:1205:b0:220:fe36:650c with SMTP id d9443c01a7336-22976620f8dmr7927775ad.23.1743618567870;
        Wed, 02 Apr 2025 11:29:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMF1uXng/b3SMVahihOal/Rp2xq0GwlgD8jTUHpug2KPW26pazW4/py3y/JtwOdtuIQtQCkw==
X-Received: by 2002:a17:903:1205:b0:220:fe36:650c with SMTP id d9443c01a7336-22976620f8dmr7927565ad.23.1743618567477;
        Wed, 02 Apr 2025 11:29:27 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf860sm111978885ad.115.2025.04.02.11.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:29:27 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 0/2] wifi: ath12k: add rx_info and replace the usage of rx desc
Date: Wed,  2 Apr 2025 23:59:15 +0530
Message-Id: <20250402182917.2715596-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67ed8209 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=V4QcQPTyrmqQ3YzeKasA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: osxifZbYYVxl6NyvVdEGgWDOsQxczzm-
X-Proofpoint-GUID: osxifZbYYVxl6NyvVdEGgWDOsQxczzm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_08,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=464 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_112931_055876_0574714E 
X-CRM114-Status: UNSURE (   9.08  )
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

This series adds rx_info to capture required field from rx descriptor and
corruption in rx path.

P Praneesh (2):
  wifi: ath12k: add rx_info to capture required field from rx descriptor
  wifi: ath12k: replace the usage of rx desc with rx_info

 drivers/net/wireless/ath/ath12k/dp_mon.c |   4 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 171 +++++++++++++----------
 drivers/net/wireless/ath/ath12k/dp_rx.h  |  26 +++-
 3 files changed, 122 insertions(+), 79 deletions(-)


base-commit: ba613742db305037ca2193b2b552b769c4f2a5f7
-- 
2.34.1


