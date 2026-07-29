Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D096C53219
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=; b=a8B/F4whxzkE/y
	CH4fpFRT52vSRGaTMpDHLBArmWsrUZrBs7lLupMtMas7p56LoAB21cBbkFsshbzI7QwNPnr4he5oB
	uSQg8GXcPeZLlYhvSynywRD9KwnuhivPM8cIZsL1waQfEM51/wENdloijPjdKQfHM6R1RSHKsaRT+
	c4BzBDyO2rgZOho8e1/CqJsH6Lnfx8qBESWndPCYPlsMiBhxFF1Jl67RxrzppUia3fBMkJBID5Q5+
	NhsX9YXRkyWYncqsW/fTqgd65vr17KZFnXaLyZ5qZ+TtT2kjXWeW+ccdvdldJ/ECdrCwz87+ERXjU
	XBcNxs6OfPKYa9o4zhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Ay-00000008OtH-0uHx;
	Wed, 29 Jul 2026 15:26:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Av-00000008OrP-2aSk
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 15:26:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3FJ92593219
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MZOKf9mSd0crSLc2wh8F4z
	MblAYXsOwHLgHJ66RKogc=; b=WWHVAYtI7Uwd+Fy9wUpZL1r1ds+B76Az7q4TAg
	+9SdFtxrg3CXrmgqHCJSKbx61Me8KnnvZEqNrB0QGChJrnvP0FsHiIn1du0qiS4c
	wi3X0AJk5Jwx7sCFRU/t1EYIPEJBoT4hejObiIh5wKvgfTkZ8XRacUlXkk30nb3t
	0/DM01hyOnOZNzqeoc8yaRNpzxAAQnqtEvprrbP/wekbk1wJ2P6VKjrnPISHqTNO
	CAWzwnXdnYVFX4DDyJA03NKK5jBT0Pi63owkwkQLcysOklLvmCTs3Q6V9VjTOsjy
	/UHmO0bewUemU7A3tQtlnzROL/XD7Kk2hdEe5RTMakpDwkIw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqke08b0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:26:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso1405293a12.1
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 08:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338788; x=1785943588; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=;
        b=KB8KdLV/poZ0Z7K1wpdhq/Au080cCq8iAnPL1W1yeFjcMOGCW+2p/LSEwdDHwT/Jfb
         UG340xgZiNrkJNM+fD3KKTBhheXufpSf7STIvMUflGu/FtHq2XHrCU5MfyK7hsW/rEto
         5so5x+vLABKqha808OBd35CgzK3+0HcGiDDcIIQQGKO+XztWBuOhJPy889AGzOVVJaHg
         q8DUmahvWHdCq5JOjN9cfnYW1MDGnYMsjPLcTOfAaEjYat22Jpw9M2Gtj2qSFwrWUWiA
         79GT4GKV9BnDqJtTU6PwzTYwY1efCI/S5FEn6RcHX+h5uYTTarpUgQlYocOwPx8ukihd
         LIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338788; x=1785943588;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=;
        b=JmDIPrMMA8XDGOIRt+7wKhS3Dpv0O72l3xsCdGtoPbqLx4FwOIjmpwzzkusHdqzDd2
         d707B75zd0YQ/Z74wBPUFQh8eAUmY/+4BYSR9iK8HFPPmGdOo1NMHdTmTpxZ6BkmmPyp
         2RQ6GlaGRQXyjjW24Vr158osZEWCdBn0YFd+mWg7UxJxuAS0WTWMOhDdFK4YlpzWPj9s
         LrzkNVVWSSM6iHt15P3vCEoFD7ex9p0f2Q9rzy58AGBIW/ZgmPNJ3t1t7wypj1y+6Cql
         hW3QrOBo0tZjuMmRCztJr5+utIrQ+aD18+WFeHzNQDq4gEmqhB2OjeknqiwlD3n1RZCe
         YG3w==
X-Forwarded-Encrypted: i=1; AHgh+RomOQDDkGgTxVO8Z821tfBfWyS0FIt1472Pv+HrsohtBd//ILfdTXJi3Ow5pLMML+mXnDN0ag0=@lists.infradead.org
X-Gm-Message-State: AOJu0YznsdScGSw62JO17EgdCqsVfAy7AVchUR2RyjR8JB32o9svbehV
	DmKiN3c3H8r+SJGEEINsH7ayh1gJw8vthnh5Vcr3goWgU8+Zw0EVXoIerVAQ2OHRYCf1kb7yACi
	Q63uNR97fj5FlA3cOFV+hd3WTarDK/eaqNo9iWWwT6P7UhLpMbchYWMGoXmXqoryp
X-Gm-Gg: AR+sD11Mkm+mwF6c1fpHM3KG2uEaqfpt+28rkeYNgikfw6F9GDJUdAOTimYl90unezn
	YpB3N6gsSBuyvh2tRgPw0+WGPggp+ARRSkZdCvW66oVOpathAAeoH44zX6J4nUjaxr6LP3y9kt/
	LoJpCDPy3m5eprwTUqjTDmTq2fjWyV12X5IpF/oV9Tx/CYzfRkx6I041HVlSCQ/Rrw5oDFmY82T
	sf0DNvHsR0qdxRmb7ZcEwRe7kEjXmn9CwdvhLwZK/Y2NjUMJlHkjvkOj8syfsiPSp7n+wY4KdtG
	23/7ATNN+ILbdAagy7wEP/lmCDhWOJUr2gYEsQsMBMfkcyPJI8BDm2jVxk94Ha20r6Z1GgaW1YD
	Ag90aoT/42v9axVvJknXfocQkaKb+HgmazG3zv5USwT9RxjpQK36aJ30=
X-Received: by 2002:a05:6a20:cf86:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3c8ba458430mr8314531637.25.1785338788346;
        Wed, 29 Jul 2026 08:26:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf86:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3c8ba458430mr8314481637.25.1785338787817;
        Wed, 29 Jul 2026 08:26:27 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d480c5sm18005300eec.25.2026.07.29.08.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:26:26 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
Date: Wed, 29 Jul 2026 08:26:24 -0700
Message-Id: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAbamoC/5WNyw6CMBREf4V0bUmp4eXK/zCEXNuLbWIBeyuBE
 P7dSty50c0kk8mcszJCb5HYKVmZx8mSHfpYskPClIH+htzq2JkUshClFNyBakeztApGakfwhJy
 Ctxq5s+QgKMOxlLXMK9HFA4ug0WNn511yYRAM73EOrImLsRQGv+z2Kdv3f0RTxgUvtQA4dljku
 j4PROnjCXc1OJfGeOs/xOpnoiyhVllkXrX4Jjbbtr0AXI/Q4TcBAAA=
X-Change-ID: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX3Y9/e+aF5CNJ
 RvtB+9ioilGNrv9Zvxp146TgC3RfggIvPD3Am6a3dD4N81GfefPbsMUBuyUSoA2gAwV7r1/W6dL
 Q5OyHCxtcyoeFKSX4iLdXUhLOJzZo5wjYZkegodeR05U/IteFRsQ8wGeE+6/piL6XsDlFQElEYD
 JZk+gLkdPf/HI0Zsiz9aljE9KXNqjJ7hqxAODBToSqCC+V8HBmoqZeCH5WismvUfo1MCC4NxmZC
 5eADghmHQkidTrgrhlhyn1b7ZsMOwJZ/STIQqa08e32LsM734JmHhXRdqeQNtk7V/OSIxQi6YWC
 t7Nl/OXsyZ2+PXvmZcVNdJcbBb5/8CwpvORhGb5vViZ5RwdIBdPSdKcdRYx/8TXzyIC5gXFwH8b
 OGZqdc6MejYg6qS03ZVmW7TQzXEVhHVVqDzHr1wJKLYUvIZCOWmvsDa7wSrEdbw3azKOEtcbtFr
 7xMmT/OxLDay5+za8xg==
X-Proofpoint-GUID: 3U-YmbkZELiRFI27I7fKMludWSkql8JJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX5dYUXX/uSANU
 69gufBsAewWN5houVK4FIk6C6QJEREgrYGU1xaIAk9ISYVCHQJZ/iluOy9mqX2I9pvFnJ1Jq96y
 ebSUcFRgGl2BzywQd0UeK0kq+xp0Qkc=
X-Authority-Analysis: v=2.4 cv=ONYXGyaB c=1 sm=1 tr=0 ts=6a6a1ba5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=rUlN9L5Rg0sLS0zbAgQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 3U-YmbkZELiRFI27I7fKMludWSkql8JJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082629_659234_D18F6899 
X-CRM114-Status: UNSURE (   8.55  )
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

Both ath11k and ath12k have the same issue.

---
Jeff Johnson (2):
      wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
      wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()

 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)
---
base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
change-id: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072


