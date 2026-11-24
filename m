Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665BE606A31E
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 06:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tw/PHNuk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzyqnVzs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S2SV1k0B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=O/0Ly68nj0LRGPali9lfccFxWZ3jqjed812YeNPK6Dg=; b=Tw/PHNukvjF1jt/U3X9erFd3Kj
	tS2iBkxElPL6/TTvbkoa07q/pCIzGOStvQYdTBUcM6+UMI//vDUVnSoSKUBNUJvdSse7/srDCA0z1
	LYdyo3JwbotJ/Sfbq2iupIwHxLulISI6ZaBElYLK0IK0YjAuGcc69IojpVtM+5P1wjM8h9F8UxRFA
	i/iTBNyatTqRabURI8ubVYDuSTi0sEfi26IwK27OfRUOTrZ8jhc2Z38KGhcmq87qv1qg32ob0dbUQ
	56vlWbmbz9UVvLHSA40RGq+B934Uu+hBFjU4QoOrM+k8qbQtX37KuQ0oKyX2pCl7hqJjUk+cNaNXK
	1txmVGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkTc-00000005gx5-1Z5l;
	Tue, 24 Nov 2026 06:58:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkTZ-00000005gv0-1uHX
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 06:58:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2lglI1598262
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 06:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O/0Ly68nj0LRGPali9lfcc
	FxWZ3jqjed812YeNPK6Dg=; b=jzyqnVzsJhkJmzQ4FouAoJMoeBrcRvH/WBeaMv
	pvc8MYd/sCt5LgoO+LyGofONbuY6ylJ9WEqoIX80N4YS1vk/8eZnd+0r1ZP0Le2Z
	DhaU2MBzloL9pDPYMjEVLy5YT3vRt9II/tX8p5F+VzxxSVbJ9FJbpq5Fgs0JMb3J
	s02R+IMk3JAcKHh8T8QV2Z3rnhuXtmfqnvT29jZjqz5TpJbjhgT5uTp4JLDDbYMO
	5cLoiQ56Rw1uOOE4F8WUSj9bs/igj7PBgGIRxXgjz+jXmBIqn1yhPhKqIwQH08zE
	3nC5g9Z3eMTQxIY60VoNEDYWJehOMRreaP7GeF1PVKVYYshQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqj7xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 06:57:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b427e5a37dso3338217a91.2
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 22:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795503475; x=1796108275; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O/0Ly68nj0LRGPali9lfccFxWZ3jqjed812YeNPK6Dg=;
        b=S2SV1k0BgwVPkgOLzCZXVRpnNlFfvj8hK1hhzvGdUI6pKYjNCdPVl0pVyac7OoZroV
         BPwYZqwowF/YQzROx1TbMao0IfrzXSMID/jnonnXoyklhLde6N/8V/kkxYwZMI0E1d12
         ULnHr1g9JjDiiOAiz5xkIfASIVxWSFyZazmqn2g1TAHH1wI8z/jRnlTiA+GbUHdjE/sc
         iQ2HVX23vo1CRUANoZ/LMW9DS8DIveRNgwd3OnDGRxLDmsebXyYEP1dYx7M6UYnM5NH/
         zwYK0d4qH3ZLbEBFgxm862hUpg37LKc4dsRZ9GdaP1tZzhTqnlSsasM2m93AvhdOJ/3B
         1YNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503475; x=1796108275;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O/0Ly68nj0LRGPali9lfccFxWZ3jqjed812YeNPK6Dg=;
        b=k0jav7wVi0a22uwb2HREQ8PBApi9TLnUfa4bv28gKa3kPldvuncLZOIxcMSuR5ntPB
         BIORoXKnoJcY4VScthZR75KZ3U9UHCijNJtRv8n42C4XyPAQCjkmwShZl9Cqc+hbZcPb
         N9Zi/HL1hXpx75Zoxxro6uoJe0ZTIek5beGAixL+tUoOfp3zYUh21zw3ZaYhw/sn/J8r
         oLy5iAegI/2U4d+vDUTnCsuI0YMh/frdRmZWdE6oag6q0C2J/va7fd70mPsRwkucdRBo
         0h6ySIM6ZhLhxVSVzHQFrxXvRaBy0QDHIm77DgRz7o2ujs5CscYgCZypOnd4wa5qfKsq
         Y2Dg==
X-Forwarded-Encrypted: i=1; AL+hErEoyWE+dJU4V7axueVoQOxHCiJ35ZDlauER6V5gDzT+O9VIgKheluby2LJArG6oHdSn3p+s4TU=@lists.infradead.org
X-Gm-Message-State: APuU4Z9wnlekPxtE3WEHy+Bqz5Y5vOMqst9brxRdiVIefOBF72ixnqIT
	bKqAWy4TzW+yvvM+/WK/5NcDZLtRSye//GyvkmrVcAfQ3o/G0YV1H0imTR2IyirLnnS5KjDyCSy
	TEumB/K6sVDHpsHwPe/q2G5BiuvTP8Z5W7L3YShQyUG9syicWv4YbA3Dgk6WYdKWt
X-Gm-Gg: AZFdTZf1V/n+VlrssQON6a66Ko80lumQRU7VfM4Rk3N0zOW8unCkjqLIBYZ5/TNDXZZ
	4IQ7vUQ6of5VJlBdfK8tA33wMek+YDHoVm6pn2vxRlgvYJEccqI5vYjQ0+3luGZPjkvNINzW42x
	xI5QvQLNzryYzBQa0wUvo4yr0P5T+vMIk1wGI5zHkZIaB9TsmWqGc9Mf/g8eV8EwUdxzGB8b72U
	KGZ2o70NtT49DlB+d19OKlAi618yuGdxG1hPkQ06vVH7c0KqKDDSkify6AKE8tjSRtFM/Nw36zV
	piJ9dqsDeCNzVos63dkgVRatEmZQfeWKxRvSDsUt8GifdUQnSxaTU49QnMAiD3qAbYwP1V8I4+c
	lWKVcw6f2KiRIzzF+GzkxkpoWKe9LYRZRMf27a7n+TMYuEaq9mqoi20EUMKlcfoSqCDUhP4g2Ik
	z3f2PxaBdSEBnKrcWa9NrD/vbZoZ6W9LuhbHPWvv9m8oB3EJtv5IrG+zqdQLw5oj12kciwJmiK
X-Received: by 2002:a17:90a:c10e:b0:3b4:928:dc45 with SMTP id 98e67ed59e1d1-3b41c8ff7ecmr12595866a91.16.1795503475110;
        Mon, 23 Nov 2026 22:57:55 -0800 (PST)
X-Received: by 2002:a17:90a:c10e:b0:3b4:928:dc45 with SMTP id 98e67ed59e1d1-3b41c8ff7ecmr12595851a91.16.1795503474598;
        Mon, 23 Nov 2026 22:57:54 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm23819811a91.11.2026.11.23.22.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:57:54 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Fix AHB IRQ error handling
Date: Tue, 24 Nov 2026 12:27:36 +0530
Message-Id: <20261124-handle-irq-retrieval-v1-0-e2403fac4e9f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGA1BWsC/yWM0QqDMAxFf0XyvMAaZCv+ythDrZlGpNvSKoL47
 2bz8ZzLuRtkVuEMTbWB8iJZ3snAXSqIQ0g9o3TGQFe6OUc1muwms/pF5WLtEib0RNz66O/kI1j
 6UX7J+r99QCgDJl4LPM8lz+3IsfxeYd8PlNGaP4IAAAA=
X-Change-ID: 20261124-handle-irq-retrieval-822eb8c8728c
To: Jeff Johnson <jjohnson@kernel.org>,
        P Praneesh <praneesh.p@oss.qualcomm.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Balamurugan S <quic_bselvara@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b053574 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=f6HrJeQhf4BwWiaRWL0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfX7xRwWDux85+j
 igLKjK3YgzaEnx1RiEg/xKDMUB6Qea2i7dFN0LOJ/1GS4LXcuoEqpHtTH8LOSYcGn02IKadSERn
 WoHpbHyFk1MbErJW9CBs8L0JpQbhOlviJAqE/N8tc4LayTIJlmIQeTJquqwbm3eVPZd2dgpj8mT
 4S/KWxOyTf1ylMkqnUZ2uPpPEHa8v5vW3lT6rrfAKtxWNIWgpbm74ZUb6eLfis5AzIDB4PLj5Je
 b6i5myoNKPbscBqHmqtsDpAiHhwWZopyEwoIPES+35APca/Uj8fkkHOej4g0vHfZtLfbRHF1eSo
 yjuAcST+N4nZhP9dW8nKHfNAxSpsDZ83LTNtud5CxhedXIXQ9/UAUyezFPtTtE02ODHn+hIkugu
 nd8QVzKa5AtrHen64wUiP4L5Cs+TdI8JDc3VDDGBUGXlbPgrwXVDdZogB+oMRRjfDykZrZjO/I0
 vywFcxL7bKnvaTLkpJA==
X-Proofpoint-GUID: _bB8rrqXhsmaV12FsgGmKdPayCb9OJna
X-Proofpoint-ORIG-GUID: _bB8rrqXhsmaV12FsgGmKdPayCb9OJna
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfX8+P4Nh6Rpba1
 yyq+KgG2aS5cNrVHcQzxnQQfg6+rQ3VkzeCU1UcspxX8YERsf7/hBCklNZIHVXr1PT8XN05WkmE
 GfxtwwC+GEpCFJF+UYDwq0O81vb1V5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_225801_622504_B1B3BCF4 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Handle error conditions in the AHB external IRQ configuration path.

The first patch checks for failures from platform_get_irq_byname() and
cleans up allocated NAPI instances and associated netdevs when IRQ
retrieval fails.

The second patch handles devm_request_irq() failures by clearing the
IRQ status flags and updating ab->irq_num[] only after a successful
IRQ request.

These changes improve error handling and ensure that IRQ configuration
failures do not leave stale IRQ status flags or an invalid IRQ number
in the driver.

---
Aaradhana Sahu (2):
      wifi: ath12k: Handle IRQ retrieval failures in AHB
      wifi: ath12k: ahb: Fix IRQ status flag cleanup
 
 drivers/net/wireless/ath/ath12k/ahb.c | 46 ++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)
---
base-commit: 03b7c601b6e314115015a57061f5b377afe13190
change-id: 20261124-handle-irq-retrieval-822eb8c8728c


