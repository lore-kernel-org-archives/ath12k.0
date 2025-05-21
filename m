Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D04C54E71
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 16:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N7o8Gtv5VKo7HD4i4yWeR4Voh2e4WFUyOnmq4cK5Mg=; b=Pm9o0HfOQm9k6l+xhLSjPYC88h
	bDDHbjtkDPhFZp30mmPNF8zeY84JdK/iLCUJwNEN63JZ40a3p/QNv98xnsqrDq4UZQLQ2hZU0zDiv
	C9siq4MEPYjj4A7gMWrIVaW1fyrjRDmKoSLRqbsgZ/wsi1wisEYyNAq13KVGPfr0DgrUO6V40p0tx
	r1ex0Nle+gNrFJbsUmgpNuxBNLy31VMXYDCxBwqfmKPMT2778xLlrIes0wvtURsCpT7riorgeOE08
	myAZ+IUCyrWQK7rUNUG7Xc9fcmONcx55Gk1k/oaNatm5Qa6kYWu8CPsLphZnY9kgHwePIRbWqo7Ta
	AOd5WUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmnB-0000000GWl5-20C1;
	Wed, 21 May 2025 16:59:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmn8-0000000GWk8-47Xy
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 16:59:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XMi9024816
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 16:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9N7o8Gtv5VKo7HD4i4yWeR4Voh2e4WFUyOnmq4cK5Mg=; b=U5E5m+hwpB0BYvuy
	/RGutLbzB2Mkhg+HM8NieZCdUzAhRoxukoR0MkRILP8sWVxk1wkgensqHYZfAhRP
	5FMB0g4GGFbydQBgjdOTeoq+R+v3PFaRyBz6dpskMJM7APmX2DL73eR+ghQY8UQ2
	1kGWvf3L2nuuO5WuOa/7L5q1oYk93zPDFe+oIU7pAWHwOPdfLmkGjXld1sdg4muY
	IMCxTL/w5DgL/Y/x+tRmouuCK+6FAIvSd/U+PZ8S12K8/J6wzB5cfFwQoDqVNWQc
	Bm0tdhDE4Iy4Nr+QIs2FvsuONBDXCv42N3R25AjyK6CKvjDWPYbgVTk3sXgL9z7+
	SC5New==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4umw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 16:59:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30e9e8d3e85so5612553a91.1
        for <ath12k@lists.infradead.org>; Wed, 21 May 2025 09:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846781; x=1748451581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N7o8Gtv5VKo7HD4i4yWeR4Voh2e4WFUyOnmq4cK5Mg=;
        b=h40QEmBdULN8nRAYs3kVZ3S9Ef7rk+lF8zvpMQXesJ9UNNkw7zvgnrQcNfz3doEKJr
         +C5yBS3i+y1pcSTtPv1VdEx1txmU1FUxAp53s+yXE0dlpbjxFcYNn+dP7Dkr4/OTZNQc
         h7Ehtw+c5z2GpgW1DLTEMnqgzq5ZLUPFreRckyI9ijAtHUedM3mtApK7AEoOX3kzMCwB
         sXLUPUbwHnk0u7qOe/puTbRKaUN2AyTKByUYY7XFpBzed9M1isbRi0ssGRYxVYiisUVy
         lOQTQRMfioHNuM4DHy6a7BSCwEPYKh/bjsGuy9g8hd5oCEFiy96aMFWcU9WVPjKxBJii
         sjIg==
X-Forwarded-Encrypted: i=1; AJvYcCVSTmmIRlfiuA81KuwOW3Ch236rStYVHOxWk9H6QfBpEEacXsNlSvwO/6FKm2n29rGdxCKzKRU=@lists.infradead.org
X-Gm-Message-State: AOJu0YytZMMAXxZe4LZ0a+oCQvsj4apz2IJo2JqQgg/nWdZ2Awb+SpaF
	znDAVWbCmiGY5/Q5TC5NH2HzupHgk8b2sK2gp5PKcmEGisUTI6p4AetZ07ktmBddxoFmvM7KeCr
	5pSozslfOmXU7kBmg/dNoQpXo6539v5awSMLDS0cSlw6YDJ0rCbfqH8WlBimrdGxly3ZJosPw
X-Gm-Gg: ASbGncuo8W4FiJSSKd/t8+FLnK/ru7KMkzVidPhF1iKoKteRwaYcZTyG5ddMf+Nm5Ja
	IM91OA8oXQovD5sHIh/Vfn7rGzmRha+oBexVEYkGtvCitHMqtMaJZjncYC/UQbWHZd7QWD0HOvc
	MjYoNz7hAqeU+qv7qgsEv5CXeVWp+9E82jRrOLXmzfJo5Wd+PqDdEjhabz9HP/QDV0kFBEpt9Cd
	qDa9qvteyDKKNZJj3yWoLETwr0fJFi/Q7RILZmOISTPIDBXt4wAJAXELLgILt5d3CpdfAXhaP2v
	/j+lAYZlg4HfrPmLJxU72nJP3MWyRzbdxiVY9XH+k39L8u/wPZHOnQ0u3wqYElRNOFXEnlPrJEM
	Uclz5Qbw+nqaqUR26c5bjAmbBwyrC6sQwZ5uY
X-Received: by 2002:a17:90b:574c:b0:30e:37be:698d with SMTP id 98e67ed59e1d1-30e7d5bb328mr29656804a91.31.1747846780561;
        Wed, 21 May 2025 09:59:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZc+dVjzwwaVBTS3Tt9uMHWT6AEG+rnU+TbXB/vJXuImTmE61jp67BAaSi5VwpwBCimgRn6Q==
X-Received: by 2002:a17:90b:574c:b0:30e:37be:698d with SMTP id 98e67ed59e1d1-30e7d5bb328mr29656776a91.31.1747846780054;
        Wed, 21 May 2025 09:59:40 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4ee3sm3875055a91.18.2025.05.21.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:59:39 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Wed, 21 May 2025 22:29:29 +0530
Subject: [PATCH ath-next 1/3] wifi: ath12k: fix regdomain update failure
 after 11D scan completes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-ath12k-fix-ah-regd_updated-v1-1-9737de5bf98e@oss.qualcomm.com>
References: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
In-Reply-To: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <quic_kangyang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: cZKTnH2ZFnWxWj4H61BySXq2pYAQbMBO
X-Proofpoint-ORIG-GUID: cZKTnH2ZFnWxWj4H61BySXq2pYAQbMBO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NyBTYWx0ZWRfX+fdoJ/jgsqTb
 lHGxtpPKC/JnPaL5Fjs9aRUBhkmi9a0DinoPyCpCjAg/ps80YJayWdSDm9m5RT91vNc0kt3odvX
 pYGScpTQLk6BaxNwn7pM10EZ3hVAAy4gQWm1dEtGe3M4dcM2Pe6lyC7GYg3EOg5EqCws9SZ/r7e
 PL21cm1T0w3GZrcgC4u/LOoeVvDeGviHTvORaHm54fvuK6aRvu8QTCj+iq3GgkoPMzUYqGlumNt
 RVyru3tCd0Fot51Ha8kCPN0Q2c7QSeAfEAK90mvOiNqwQRFDQfV5bQJPHsAFXejUe4pZpJbqPDk
 uygKL/JCW/iGDH1VugZkl4c5Er5sT84RQtZcp7EhMtoQYdN9B8DE62SkzNjVXGbHEr5F+EmyCgf
 DplTMPcyz8IVS4m03X5OGJacRzXIwyu4CMGT5g/Nx9xe5Zz+RPUOxTVdQua0a3C1xeTRjwV5
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682e067e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KP9DAE7PHRlDfdeWwEUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_095943_158571_C676E31B 
X-CRM114-Status: GOOD (  15.85  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

In the current implementation of ath12k_regd_update(), the ah->regd_updated
flag is used to ensure that the regulatory domain is updated only once per
radio. During MAC registration, this function is called to push the default
regulatory domain to cfg80211. At that point, the hardware state is not on
and hence ah->regd_updated remains false.

However, after commit 4c546023d71a ("wifi: ath12k: update regulatory rules
when interface added"), ath12k_reg_handle_chan_list() is invoked when an
interface is added, which in turn calls ath12k_regd_update(). By this time,
hardware state is on and consecutively ah->regd_updated becomes true.

Later, when the 11D scan completes and a new regulatory domain is received
from the firmware, the host attempts to update cfg80211 again via
ath12k_regd_update(). But since ah->regd_updated is already true, the
update is skipped.

From the user's perspective, this results in a failure to connect to 6 GHz
APs, as the default regulatory domain (the only one pushed to cfg80211)
does not include 6 GHz support.

To resolve this, reset the ah->regd_updated flag when handling the 11D
regulatory domain update.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: 591de41d7008 ("wifi: ath12k: add 11d scan offload support")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 72e7730c7694bc7a5fdcf007fee1310bf67b5654..60e2444fe08cefa39ae218d07eb9736d2a0c982b 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6125,6 +6125,7 @@ static int ath12k_reg_11d_new_cc_event(struct ath12k_base *ab, struct sk_buff *s
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
 		ar->state_11d = ATH12K_11D_IDLE;
+		ar->ah->regd_updated = false;
 		complete(&ar->completed_11d_scan);
 	}
 

-- 
2.34.1


