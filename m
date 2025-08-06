Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF473C87FD1
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8OlUTnwZcyK3PYRJ/4A3K5RjTuSKvhawKHZj5H9zf4=; b=qabWJvnIoermmkWvjVQJ1BSfPd
	+ESuVy6uhBCIi34RC6K//BYAeMBNlNFmolRDUMy3VUatF3QvOaHtfrTWEt33ED62azQ43QQvDyIpC
	DSPlMAEf7OhgHcycZkNBilZpW5LP0gUkzsNrCt0SgcPAackEKrzWwVSuqtvK5v0u1QBqzVgisFR5e
	5idzDFQGFaBRNuPvbTRaMlhzeFATRsMK9IdNCjpRePa//wqdAf7xmo6x91vZk+dVxBQWCILGnffOu
	9qubjRWO5YtCDZAy7vP3+AD5F3ahtxcOJV89/+kbDxYAKVlIv3MLKfvcmmYWxqrdbWvm/dgCW0kvl
	pkj1t3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9j-0000000Ezfe-2Xay;
	Wed, 06 Aug 2025 11:18:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9g-0000000EzeX-45ZM
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 11:18:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576AMijT017319
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 11:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=M8OlUTnwZcyK3PYRJ/4A3K5RjTuSKvhawKHZj5H9zf4=; b=nL
	MIynCoSk7A0JkUUd2SBncKroYMCp/bTC6mYbc8fjK55yrc2uFZUQRDrOUd6aIsQy
	a1n7/o2dBga/xAb5us/hhhVfkgR8NRLnsJImKGGvG2fPEW9AtnwYFHTNMslmIxZ0
	z//POQdWxLMc7hUVeatHsl1vN+uNw8LF538zFZdjXJhmMjat3ZxbOFbOmFJGQziF
	30F8Qf3gWdOAvkDK3qtZUSvdLkBgXWxBwLabnPyGhD008qyjl0OsvfaLltbGTTho
	/d2RBmLEhOvm+t3acKmQdy/51tfJfZOYijQDjDfVCXER5u2KGSlfzrB4a/2Ppr/w
	aqMyxGRlslB2wDYeH/Yw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586840b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 11:18:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b321087b1cdso8549564a12.2
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 04:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754479079; x=1755083879;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8OlUTnwZcyK3PYRJ/4A3K5RjTuSKvhawKHZj5H9zf4=;
        b=gt+mCiraitIxiWfbOvgL3spAp+vZYN7xn3KyKLflGlkeGnGDiJufH7XZ3HXL8iMtnF
         Pdp9eMRk5syAk5gh78G0s7LHTDJrsZ1S6BKNhBMJxUG1Kq3s1SiSKzLmuePFhGoCQKcJ
         ZJN33dgqZ6PXu6DG++4Alhy7OvUgFFeirWc2Ng5v3vSiw0ONFjQDzl5z9q4fHR4YTUb4
         1abFYhZ3yoh/pMLmWpi40MWhmzSRj3h3qwCAY0lpXptseOAgtsfiWcM/NIwnapmxQv5v
         D776EN1vjI4sFQPT4wFWzm3iWB3u7kNjmgRCaRmrSfiMWd3CzJc4emioez4Qwg1sO2iZ
         Ki7Q==
X-Gm-Message-State: AOJu0YwvVp3CcpS8MaQJtxrhi2Wgg5EPWhxj74drAT6sngdT2BRF/qr4
	O6L8PI79bFdKAz73ITZijyShFk715VUBX+hZ1HFDgzsMLJs88H77ZSppybE/8jBj761ekevNpFO
	VXufctuDkBXvtYPVZM1qFdpKTV0ucS5U5zde7PnYaObHdpl5jX5nS84Wlak/7G/tM3V2TPaML
X-Gm-Gg: ASbGnctVAxbmRsrfNc/cmjZcz++lUJ/mD16+a16URXlObimYzO9fLATDFSPLt9/oqlb
	GxLyUDPkzmM25n/Ra+Uh8MF8WVw+D+H2k21Zg2dobKDdr1rCG3FMkJaDHAwSAzEtNWQ9VNlQE0i
	tVGjiAaEiPSvY6SClWxi6SZF5IFY1zFSGmCm6nP/oZ6o7vEe6C+4k9Xjv6QHA74QWXI/qG80C0K
	XqBad73WNkYFBxZ9imGD5xO+d94n+4irRERzjc828UD5n8DdPTsxHRVXWb7DEeXOxeyzj+CA/2g
	NlnWc4PDNZQLrZlQ/+5NwJVr0lQyZ/sb2TPW91BhCUg3JV4QSo8NyLpoIFA9E0AXB1VZ/QGpleB
	5HPjg3mdk5pQc7T0IPx29aJiSJFqf7U2uYDs8dBTQnKDXEzEVdoyIpl8D4BZJs9syGqqKcrp4iA
	==
X-Received: by 2002:a05:6a20:748b:b0:240:f96:3153 with SMTP id adf61e73a8af0-240313b273emr4417289637.29.1754479078720;
        Wed, 06 Aug 2025 04:17:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb+fouAuUF/TdecC/26sFjTqCnmLWhb/ae7a5ZTqc15XHhchI0KBGtqhIa47bSGVut5tGMdg==
X-Received: by 2002:a05:6a20:748b:b0:240:f96:3153 with SMTP id adf61e73a8af0-240313b273emr4417253637.29.1754479078314;
        Wed, 06 Aug 2025 04:17:58 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d9dafsm12984111a12.23.2025.08.06.04.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:17:57 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-current 1/7] wifi: ath12k: Increase DP_REO_CMD_RING_SIZE to 256
Date: Wed,  6 Aug 2025 16:47:44 +0530
Message-Id: <20250806111750.3214584-2-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-GUID: KL3LLFbPf-h0jex6V9mIFw2kitTRccoF
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=689339e8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=nBVPt6iOZMBRpZ3gKqsA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: KL3LLFbPf-h0jex6V9mIFw2kitTRccoF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfXxA1uk+rANGgH
 V84jromrodE/DSSe3sANWeq1rqZjYPQphJHdgjR9kZYChEiFj67T8YnXjPqBijJOEr9T5fTK7dU
 hl7TLCNbZIT7WElKmx9LkU0rxtqpUibDmAg0irM1zNr293w4shmmMetJlRLUmwwrCTLPzZYzYab
 VQV05lr3ZbXwiGax/lOYYFmHYuP4mS9hJi61gidYoCCNowrOqJur9f2Cu3Tn4VDbcOCN3jPwdf4
 BJPzkd5+3wgTYVieKA+b+JN/U/iUNdpJ1TD2wdBfsd26BD3wT/pa7+dZ9UwlACBi4e0HHBD04GJ
 ConorE08pTYm6kADhVVkrw01Lavphg17+qjrDSppp0eVQq2W19T5PpnpFg020Xl1Tj2HDJzDanZ
 OmddmNRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_041801_125688_DC9B16AA 
X-CRM114-Status: GOOD (  11.84  )
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

Increase DP_REO_CMD_RING_SIZE from 128 to 256 to avoid
queuing failures observed during stress test scenarios.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 7baa48b86f7a..10093b451588 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -184,7 +184,7 @@ struct ath12k_pdev_dp {
 #define DP_REO_REINJECT_RING_SIZE	32
 #define DP_RX_RELEASE_RING_SIZE		1024
 #define DP_REO_EXCEPTION_RING_SIZE	128
-#define DP_REO_CMD_RING_SIZE		128
+#define DP_REO_CMD_RING_SIZE		256
 #define DP_REO_STATUS_RING_SIZE		2048
 #define DP_RXDMA_BUF_RING_SIZE		4096
 #define DP_RX_MAC_BUF_RING_SIZE		2048
-- 
2.17.1


