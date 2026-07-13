Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549EEC43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vonu41nazZKgZgFzgiMlMdUi1Svr1anpCHuYLg93am0=; b=fbech4VaKnpIroEAv4VTBB4F1y
	0qGN3xbawsUkrAu/NNryOROb5WZ2Mu3zKJmn8bjun778e6kj/XEnNVTgpdO9aePU2rDh2vPiMItVI
	ca5HMKwRNwIE86lwRmteyT6LimGlLT/637aKlByrne+9oBWiSY3brCApsP2CJPua1gGDi6lhF46T6
	Xw73BwzIonULCKvtj3n4L/FzcRq8ik1rxWgJb/NHxOzqlEp67rlP7VZPXnxln9j3+ndAXurTkPUXN
	8g1COoAH/eh4hfNfvH4Bfa/xb9FTeTCw6c6L5PEWQMCbtSgvB2OGkHFx1WClZyQYnkoTYUhHRHHKc
	DWdQ/Ezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHI6-00000009Xsf-3HS5;
	Mon, 13 Jul 2026 14:05:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHI3-00000009Xrk-2YYh
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 14:05:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDekq1299388
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 14:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vonu41nazZKgZgFzgiMlMdUi1Svr1anpCHuYLg93am0=; b=WOQPMnj/u78/0Gu4
	LIUId8l6vhHd1IqKI6bV+dVRsUyAGlc4lFE2RFB0/T4N7NBJaKdIesmQeyoDs/my
	pFmRqgz6AYrzUmQU7NHlqPr53CwTeYkuv2EVDgYXaFpSB7i3Rz702LL9rlcXIV0y
	i2iKlDzJ5omYPSxB/30nHogUBqhRUq1ruXIVa5CKsq32E1QOt2mfy0AAm1enfRBB
	K93/At46yKf1zSpgXKlHQOXNDMd3uhGMT4wOAy0ggLU68sQt2GgtDdj978LpxLrM
	QPOO0fpul3Xxr+qJjxcSo2G8od3PUEqYtsbCPvO8LGsLIwTSiVkdue4l0clg9maI
	69M4Yw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3h04b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 14:05:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so4354142a91.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783951546; x=1784556346; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vonu41nazZKgZgFzgiMlMdUi1Svr1anpCHuYLg93am0=;
        b=CQzGzWEz01TXiEBpegGpQxjSiHY20exTebkLvah1gK+/talsaqycepvjFo4dj5p9e7
         79RteA8UpmEo4X1hPE0y4+y1oJEDoq8UcVLFkEIv7CdhLjJqHGak3rQXoOrpbRTDFy6C
         eHkh6dZhUldotDIglfQEXGH4b8q2u0C7xgPnfIdVp/nLJg1BOSEcdWNjtzjYzZfvmFbu
         aEYIuRxaPccms5w7cV3GyiSOpFqqymomtWtR0Zl3r1NUR/M5TWRo9CQaBanKCe2kKJ76
         QWXfqWDfYSHxglDiyjcWN+UqVigOxXkfEZe+2hF0IG/5xn1LfrJiQBA3tZ30o8sCc6hv
         rAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951546; x=1784556346;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vonu41nazZKgZgFzgiMlMdUi1Svr1anpCHuYLg93am0=;
        b=Q/dbA6vQxdlD7mWqHMPNKbGM7b/H1nDVwA5dzcKtYEajnq4J5uyVTjhLaGyztuxNZZ
         xpYjYZ93V9L1ViwiKr5yJlW1UER+5GOheHcKPMQ1LxdTQalFbtJeFn+PEV83dp6cw5Lr
         RlMpdn4uPfemva6GUAxrgx7b3MzK2ESzn8tkw0bQoTnOFfEnWfquhZY8pAfhypHDW00g
         GrmD/Sim80BUU/79f2V4oMA2Ui5X6KBLASro8jwsIG0uVHdek1qsKKglYH5s9FmlNry8
         c1uktbiQXj0bmNuSwxy+oFdU5IRq3fceNw4fqwtOXR3xzEkGA5mG4qhUfMIzoVc76x/3
         Qiqw==
X-Forwarded-Encrypted: i=1; AHgh+RrVdcExnsqk8lT0QPXNaVK73jzfL7n2xmCyFgwgQwFCI3bZYcgl3D97U2U4Od275fqD8HPgIZU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQldhIxx1Lx35lE98BcdIS+qG/IbCuNYuFpTOTu2fCqCwbt0fo
	qrxLe9sBOfK7pwoo4un1bLy1R68N6w4Ef2nlOzVhr6SO8nWJfL5HYsAkQ9wmVBT8gKUdnO5JJLG
	6XZMlKPETpLbnGb4tLLutpTt+xnpHWRaGsWz06ESFIG3LdCHIagwWv/0Az35Z3SN5J9kjnfGA
X-Gm-Gg: AfdE7ckwoGlgfHu5imr24i4oLQcyqDHoGKQjUeDHzely6aQs1n11bk9mERuCM0fHGG2
	XRjdW8nWiRcdrdD5w4PsDjDbKTIIzGwKx3SqaGFFgtxU/6QZIbdjixPrUSgfPmDDo0NJhZZXXRe
	pwUmlEorUXZSNGK4SbUm4DQ4/h9kt7CMBK5Q0q3cLnDRnXc680HP4ZI1OcdzI51oaglF8mKFKMO
	4W8S+l74vLS9ShSmTYaqaX/X5bHcjoaIWmGpbPCRuBgJgd3yDLGGtotsvcAX9aX/2lz96WyStJZ
	MAlsWf5tyk6Q9hHxTa0sIxsolWDmDr0nnUeToVyjS6dkxkCCHML7BhYmtreNPpsBRzGrQ9g/3LN
	cgAKyILu89AzFTS6VTev2MU031AHzgBcJQJZwsyZr1WCfC45m/k+97B1GIbAlroHKtw==
X-Received: by 2002:a17:90b:4fd2:b0:38d:a76:6470 with SMTP id 98e67ed59e1d1-38dc77c61d6mr7972436a91.39.1783951546521;
        Mon, 13 Jul 2026 07:05:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd2:b0:38d:a76:6470 with SMTP id 98e67ed59e1d1-38dc77c61d6mr7972363a91.39.1783951546030;
        Mon, 13 Jul 2026 07:05:46 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm77071424eec.0.2026.07.13.07.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:05:44 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260615112103.601982-1-jtornosm@redhat.com>
References: <20260615112103.601982-1-jtornosm@redhat.com>
Subject: Re: [PATCH v2] ath12k: fix NULL pointer dereference in rhash table
 destroy
Message-Id: <178395154431.877545.2513390294359874255.b4-ty@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 07:05:44 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: vuwkwGp3d884OPY7Zkv0xzpuNYgq3F41
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE0NiBTYWx0ZWRfX3UMOF+J+VWOh
 ImXAdMqukaimfwGOfBy47q1bnHmS7RF2g7QcILTmaWXDm47rE/Ft03uCByv2ZZYRo9RD+la2e3+
 o4syQ0Bafi8CLDZmIz1ptRKHIlLjvJE=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54f0bb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=C_xO_HesPfbxFcvR4REA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE0NiBTYWx0ZWRfX50cSB/tZ9CkA
 bSnI2i3EjaYDYcHr7JTSy0HYtY+eICpO+SJdNKlZFi4SIIGRhV7gyA3NwQJwvNKy4OlL416gXbz
 4q73iSI/IGm3jJerqrJZUtocUONnkOb0C0vHVweDdegIJH/8R3NwWJrn8vkFZJnyGB3yuL0ALOy
 hL0/nYzclQppJQocp5b3fvwGIOHFd21gcS2EoucWFgrwZ00DrUI7UICCNrgh+yjpspkZzTeH4JN
 hxSUoa0emsvQR8TJB7L1YqpUtVmfL9KAu1XLe9X3E5U7qk0EIqmQXhVVnw23xBbIZnqJTX3lT0l
 r3v3cX/MB0X1/13wxIp1fRNWlKrdww+HyFgUejnAsViVGFmf+vZIuCS8Gt/nJrMYtimwNPHkaAn
 9J24AGDHvTdhKa3C3LT1aSM8KwjJr8sHMjqBEc3nBeGsLoVdWWkRu0ELvNGHcXsfe7B8ka5krZj
 a44aw2hr7JrgJObMUzQ==
X-Proofpoint-GUID: vuwkwGp3d884OPY7Zkv0xzpuNYgq3F41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_070547_657609_3985AB79 
X-CRM114-Status: UNSURE (   8.80  )
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


On Mon, 15 Jun 2026 13:21:03 +0200, Jose Ignacio Tornos Martinez wrote:
> When unbinding the ath12k driver, kernel NULL pointer dereferences
> occur in irq_work_sync() called from rhashtable_destroy().
> 
> Two hash tables are affected:
> 1. ath12k_link_sta hash table in ath12k_base
> 2. ath12k_dp_link_peer hash table in ath12k_dp
> 
> [...]

Applied, thanks!

[1/1] ath12k: fix NULL pointer dereference in rhash table destroy
      commit: 70231dcd782201579990ded73e0435d18bb524ca

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


