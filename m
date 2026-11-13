Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58FA606A881
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UNswvGfR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FqJIADiX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c5F69/wr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HBnpD/rV5a+eJzRuAwU/AeVBE8xDRNUHClstKN9l9mw=; b=UNswvGfRFTwswj2AhrWJFDqcXh
	pEI8JnUkdlb/4LNemCr01FMatrjmzm00Eoyo3T3sZMvNl0lwrjWgC+yodk2RARZwaLQdMMEtDd8KT
	rh1npJ4bneODFOqtJiKMD8Qj1ms6RTwEpzZPhTqecrDmJEhXDUOYXWmzov0HRLOhrp18BWFoMDQDH
	mYyNVRIPVRhY43Qx8nRKbLhzL3t8S4pZquKQJg9DU7Scy+j2sXSx+U5jqa5epT0LH9IuJ0PxQvoSs
	srnnZ4fDaTh5h9y3LjO1DLtKrdOpU5Q9M3wNZD9X5eUQDQuqDKVUiU1pZwAOWJuqHHhvetEPHqTPJ
	zCgo1sSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsdL-0000000DEn6-2bja;
	Fri, 13 Nov 2026 14:52:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsdI-0000000DElW-23aC
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 14:52:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKeG2583957
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 14:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HBnpD/rV5a+eJzRuAwU/Ae
	VBE8xDRNUHClstKN9l9mw=; b=FqJIADiXaN+fVjc880J4KA+PJPqiD+jr2PJi9s
	xGB0YAo9VrdJycUY4AeWgtr+5hRbg9EMryzVLw+J5AeLvDN20ac2oMM5JoMyzpp2
	5YAxtcWAtPORM0VhkpLK5b3zWF6mrR5qySoaZTv1UBrvcIW2QD/Gu66wACfGNCaC
	W15S1weIA6rp7+8dxXm331MpjR68LNty2vwaohtwMv/Mg0imBqKbkzMo3F2mUEdI
	ECmXy9x8w1DuPtyYLSvu7G334KN4W3LzDQqS0zLHH50+r2U5U3+JwrX6a1yJ2Z30
	UkfiFQQgjGdLXJL+noUUHKuXvOr03sll7FMRvxoqRuX8/U7A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0am7mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 14:52:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2d5cc693fso174518137.3
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 06:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581523; x=1795186323; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HBnpD/rV5a+eJzRuAwU/AeVBE8xDRNUHClstKN9l9mw=;
        b=c5F69/wr7VwDafyYxiDi8JkplIfgWIwheeYbRm0BIT7NUo5e+vnknlIUWJ3TfvKbxE
         tA6ecWunTsa7OLr0gPYW8RWJpsdYpS9Wjnnr3B1rPeX8GVCFEbdM8rcKUfKaCymVc9qG
         fQ51qlxYxk40Qjf34vP7CiLjNQ1wf696/V6izCYzr9iGCvjt/W8qtAYsKb8xuVFsjpBm
         lKBCyQIFQNXjlhcRFb8B3MIBvdiyYu4BzGdlfi2CIdIzc6DiCqkMwdbOf2C5zYgnap5a
         rRBza1UrLM2uXlCKpE+ERkruZVjY+ZjSbaZoaw+FdhHLJAnrbxELD/NVOYPHRB8YWBU0
         lgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581523; x=1795186323;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HBnpD/rV5a+eJzRuAwU/AeVBE8xDRNUHClstKN9l9mw=;
        b=nserSzOgYiASacTQVbGWE7wU3P4aC00nshYRrVvxMcea19wBxdfR4Cr8cfqDE6dI+7
         lw276HzTRcERM8Qf9ElNDrAHzp/mGfFpNHjCky0TmDgrTFmV6CQUdNMhvMz26TgqDFPa
         Onp/gLlmp13DdY5HSnzDQ2v1hcbrGqsfQyGbYOvz+oX6jUTBtrROYuwo4CwdU4rFA0/H
         uyEW+j71Oa1NzKlFbfY0TzLrgd51lM/gN9K5jtvK8tqyLnpW6hjua9LU8uG7uB3Ib5am
         ssUUyUpQMZUL8pOtYlnt+MGDA2VtttK8mmsIf7YPAyozxomLGQHPoghfKY+OExDiEOUG
         qHKA==
X-Forwarded-Encrypted: i=1; AL+hErHTH/TLC5xUCSVErpnhUA4EXTQ6JgiKKy+ds0rg/1XtuwqXUMFLtmRy7Ww+jseu20boENb3PwQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8enb31WzTU31jKHjTNm1CnCo8lmgQr2WpVDygkp4KVH2J2Gl+H
	tzdpWnusdcrm32hF33rTZQ/+vxOIMJEOgYcTN6gPNRJbci6buuCze9HxW2uM0Y2cXKUmaklvjeF
	rdz7JmdeSZR5x/ckY29Z6kbNMwRJmMMnuCmZ/pJs7sSNXXIYvUc5pS6TdxBlWkWlPMELmTGHS
X-Gm-Gg: AYBFou2TrbIe7wtBTfrqUJIFgbT4TVin1W4DWuM0CJL/XWgpNgyg87GETlYi3NiGg9y
	NsYsechFC+/O96rE1DXAdreURxxYEUQD+8yUeH78cJhh76D08f35YcIXEeHyLbuLDUSXiLWdwot
	pTYtz5AHLqG69BkdCwzbg3H/kEHxM1PqdqdGg/S4n1/Z+Erj5po2Nco05KukacB7nQSlcY0ZhYc
	IcKleywgnB1R5A7zKkjD+UF0enl6XJF2x7m32trYCnTRwZxmXpYhvV3CSy5Huho67HHtpBRUoeu
	zJtjO1MO4s/OYRW47mxqz3oPlbmjqOKfqaNYSAauJlBNAJQU8A5GvE82I+gUxG4l6dHn5iedCFE
	jdwtwsWx2XUO2YFmyOA1wb9AYDsTFQErs9/RBkPYgmigZpaGJrWUER/r38uH0rA==
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr604433137.37.1794581522581;
        Fri, 13 Nov 2026 06:52:02 -0800 (PST)
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr604412137.37.1794581521863;
        Fri, 13 Nov 2026 06:52:01 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566a4a2csm35910475e9.0.2026.11.13.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:00 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/4] wifi: ath12k: rely on ieee80211_rx_list()
 to send rx packets to mac80211
Date: Fri, 13 Nov 2026 15:51:41 +0100
Message-Id: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQqDMBBEf0X23JUkYqg99T+KhzRZ61I1NrHBI
 v57g/Tay8AwvDcbRApMES7FBoESR/ZTLupUgO3N9CBklzsoobQUUqJZeqmeGFY0ybPDQGYYvEV
 tz/ZeUaWkriHTc6CO18N8gwzhROsCbV56josPn+MyyWP/2fVfe5IoUFjS1jWNc3V39TGWr7cZr
 B/HMge0+75/AX6FYMjPAAAA
X-Change-ID: 20261011-ath12k-rx-avoid-realloc-6c8cb3e32165
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX021uVCZh2MuI
 9qGOUlbCoxmC9riiHmCAxz2jEz8OU4CHviffTkyynOoQHYn1Rd3WWYYcwgOat9QCXfeAmSDLu7p
 dedGuttPDOF7fyFHYHagrNGhgIeMlLI=
X-Proofpoint-GUID: UuJpqtXE9deQVI1k7ckwR7q7vUeNxw-x
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af72413 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Uz-ZUL6_wFoK7G5W0_gA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX/ls6GaZUXlHM
 RFI3lgg5VFo4EwDZ2QIwWCRYonOSnNkk+a9UIBb6z0sU3yP1xNJSDor7g9VAqofhv/TV2t3jZo/
 gjroamDYAZsOqpQuEneP/Rdf35gQOFnI7QA9J5Hf75F9wzj8cXIxTRXsbX+r6F462RjSjD2wVKj
 9boWCDzx3mh8ZcXVMxPxv2u1jyaMuCmfNEMz2mBvOcc8WidVt1/ekDPe7SB6oAQ5e2EykiC5iV6
 FY8plBjtp2Shd4ykZfCqtIP8EnNFNJ+q0cd51xv57Rx9nP33Al01Mj3HbUTGnT9JZccriwTN5zT
 fSklPsCL5kBZ73RzlFOZ63N+E0b7Nu4IfHCe6SF6IV3PU2vWjIsa87F+hD/CEkn1jq378nsfHXh
 PSXcHZ/Sf5q2GutSEWCv0cLE0M94wy21zKWKoN7jloRAjeCwujX+jKmaVjmFFLtGjP3tj4Y7Xch
 6uQ23gfwqbksDHNEIHA==
X-Proofpoint-ORIG-GUID: UuJpqtXE9deQVI1k7ckwR7q7vUeNxw-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065204_652546_F565285C 
X-CRM114-Status: UNSURE (   9.32  )
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

Rework the receive path to collect processed frames on a list and
deliver them to mac80211 as a batch with ieee80211_rx_list(), feeding
the result to napi_gro_receive() at the end of the NAPI poll.

---
Changes in v2:
- Check skb length before running skb_trim().
- Move MICHAEL_MIC_LEN fix in a dedicated patch.
- Link to v1: https://lore.kernel.org/r/20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com

---
Lorenzo Bianconi (4):
      wifi: ath12k: validate RX frame length before undecapsulation
      wifi: ath12k: use MICHAEL_MIC_LEN for the TKIP Michael MIC
      wifi: ath12k: rely on pskb_trim() to trim the received skb
      wifi: ath12k: use ieee80211_rx_list() to deliver packets to mac80211

 drivers/net/wireless/ath/ath12k/dp_rx.c       | 113 +++++++---
 drivers/net/wireless/ath/ath12k/dp_rx.h       |  10 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 290 +++++++++++++-------------
 3 files changed, 234 insertions(+), 179 deletions(-)
---
base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
change-id: 20261011-ath12k-rx-avoid-realloc-6c8cb3e32165

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


