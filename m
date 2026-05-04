Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79E3CD3430
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlXTVI6tE8D6AfR7msWNW1zdKsQO2VMSvy/OARj09vQ=; b=zIT+R6vT18LvvRek7DVMhE/3hU
	C74ruigfMiGyuNx4KkGprxSth+ll5+HUdicZDvCpwVAZrW1c/7iYOYtNit1rchSgGY/lrwr1en+KP
	gkLwLyCFvZ543NNK4YN+buppVq/65MNfIc1a+/OUm/+fbPUHUQ4tg2r8xeMTX5Hb8jz998Tcgioxt
	wTXbTMb2EdJUyY/uDypB74mIMK3LGDLhwuNwOEVjhxiL4a+2VsSgRwt4kMDlAeJKQr5MYGsklrWFV
	WvuBzndPU5xxPxqUCSJ4im8/nu90Z5vBK1A8Wdhl549kvnE/SeQxc4jbgUw5bkKEFnZwdOqZHcsKT
	+uCj2Kig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuAk-0000000DQ4T-23KF;
	Mon, 04 May 2026 14:21:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuAh-0000000DQ3T-0qIK
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 14:21:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4EZ1636667
	for <ath12k@lists.infradead.org>; Mon, 4 May 2026 14:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlXTVI6tE8D6AfR7msWNW1zdKsQO2VMSvy/OARj09vQ=; b=p5lLV8br0Ft0Xo1r
	vBtnrJE4OIGUUHArx04cK302x6A/RXURpmNnZ8nKFpMPgA4BNd+PuqpvUHrRgMQP
	tcUV1xdfUDIAj9VKi2tUK9TEabeAv7dVptVmj4rU33uY+rum5KI0PoxFK5Q+KvlC
	3v/P6rqlKYHVeVQ9RQK8dGyzwKKWaw8O1dwc5x5pUPJhgs+qjHw875POu3eFQF6p
	G3fwK6NNh6tOPKj6nUM20xeTYFVLsRAno9JVOpHnq/pAwE/FsLuRJklP/e4PcUON
	aUd78kQ9zdr8RhQfErgV98XxoZEHNZfgDoEbERJ5kzJZEp49ae942/syL19/q7Ht
	IzmKlQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx48ntx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 May 2026 14:21:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dfe9c058eso10874264c88.0
        for <ath12k@lists.infradead.org>; Mon, 04 May 2026 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777904477; x=1778509277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlXTVI6tE8D6AfR7msWNW1zdKsQO2VMSvy/OARj09vQ=;
        b=Ac9PRbJLkEr/REL+xyOQhiM1647Utt9YvDoNuPGqW93tvyd0c/XmEBgHLCcGfxldRx
         zd4GSQrfIMoAMljRWH/GIJ0G7Ea/Do79C7JcAY0F9A6bt1bdt4h4flJhVlGape/W23mR
         ilfacNabzykyqvdzBNEK5n59dO7Mb8KCIxKVJLuNn/Ifk9uf5g7czYVTiIBDzZh6LGtm
         QCH9+M8xT7lGDORXEHmICnH7sTmQsjxW2uWvMdKMyvY3E8XE+wZxnG0MiNftAczujXWL
         /ut9cAwVQIzxBo+movklHWH+Mc+KOkviceBaqgOuHiEXIjRjl9Uda8JsmUUldVG9506/
         2uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777904477; x=1778509277;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dlXTVI6tE8D6AfR7msWNW1zdKsQO2VMSvy/OARj09vQ=;
        b=sKPWnfCz9dYTPwikv/erxsEV+jkrtLGpX/9WvwiMeDA1yBEVzFbrHQ8mL9K4Na/pU5
         3+8/lGnV0neUW+S430mGKDQ6dvSkJYy6TDC5IHhr0HHbiINVgZlMpNdtAT8D6RRGum/U
         3FvOcWtw2bdaJ2Csyj9CpGhAV64AjKHjTeTlWwx0749RM06/80M1kk+UC1PK8D+Bnv5Z
         aXgHJ4L7CQ5qmALDf2sdJ3JwG4nS3YtMX/qCCoeHYpu8PVVBrjoX76yvdQJLmkkMbDfa
         MNQMQq/+DB+TLp7+juKz3NMsgsKySa1vb24+f9urnv04JZFQeCfzXSElheQYmaEX2piM
         8Wog==
X-Forwarded-Encrypted: i=1; AFNElJ8HQpw2VxgwiaWwS/AcgpNveABbkHeNyF7Pd08bOLxWFm1hVP4jl3CapgmFiS79dTmXWzlQ71s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRuzRhvGO7jQzBNqHNFueUvtuHIqJQa3RBSEx14uq4kbWXOP+4
	w5zBz/cyuDrOjzm7HX54tblmPsbD1W/f3hYgpHiOACqkXVx2nbIlVca3SyEvQ8Zf7jYxLJKGeUE
	wCYsvgINqN6bLfMaBIG24xNJogYuy3i1G2EAThsFlFjxP3oTaGqEONpuUQ5+tZ/fwrLP9rmh/
X-Gm-Gg: AeBDieu2JYKlooyNocN0UEDGxlaIrJE6RCUHytSahItGYiag8DgSERKlZlkP0R7QEAp
	tEmLMDoM8mrxEhbov6iYzPRU/epUAKmjEFU/jzwMubW2BqQ61ha/rpRQT02z73x111epyDg4bgE
	ltAYKvnb/cTj2Drm+mjssy3GGTbYd59//GeoLRc2Y9X1xT9MINqCXvwqyCvNzI+JXcbDf1jy9IY
	JfWWl09wlNIQ7cFmtwZlSV4G5gAzrE+x1BNUxhJf28/7F/9XBjCs7jNplf971VLx6/YzGqoqgRQ
	7aYxLD+/hCCG2NbpKDm+c1FkehxExCO9B4WxNptNNrxLVwl3mJI+Spgdbag6MRM729+Q8qpE96g
	BKyxZDUHVPGkC0tBnyNTyOLonowP6cU7s4oYKMwK9rM5a2aFmkTSmMq8xo1onCajqZr3ngPJuv1
	lnO2z1w3mjIz4=
X-Received: by 2002:a05:7022:ba1:b0:128:d4be:7428 with SMTP id a92af1059eb24-12dfd7dc675mr4373883c88.19.1777904476672;
        Mon, 04 May 2026 07:21:16 -0700 (PDT)
X-Received: by 2002:a05:7022:ba1:b0:128:d4be:7428 with SMTP id a92af1059eb24-12dfd7dc675mr4373853c88.19.1777904475990;
        Mon, 04 May 2026 07:21:15 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8452edesm16546186c88.14.2026.05.04.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:21:15 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260427-ath12k-fix-peer-id-source-v1-1-b5f701fb8e88@oss.qualcomm.com>
References: <20260427-ath12k-fix-peer-id-source-v1-1-b5f701fb8e88@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: fix peer_id usage in normal
 RX path
Message-Id: <177790447502.1253723.11410601963955543343.b4-ty@oss.qualcomm.com>
Date: Mon, 04 May 2026 07:21:15 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE0OSBTYWx0ZWRfX/njVybauk1o7
 R5iNorKAImyZ5FCq2YFR50N8KBBKWq41mErvXqBrMk0K0Z9Q1DWmJVMk5eJPERGGWXYaBBkLb7n
 ofl8mbXgq3Bszb7G7asieQvtVLK0TjAnJqG98jAiVsg9LjNr0CMaxIupNSYmwNxwX50a8a0TrXe
 LmWaFTm7Xkzk0iM9SeI2+avCCkrIpb6sNcDzKDuTq0TLw/kTE359Pa8aNo+g7Ry36gSV1YNwI4V
 Wg8T1UQimVFLTO8gp/8Wf5zFN41ZD2t7MAQYNI4xhvOOV5H5LTbxbHYWEKf5k/dkHnrWc2RxG6y
 b8DEB2QIxgiLJvrY9HTLPBHjsfazUrHDO8b5y9YZfi0LVlg0NVIlvn9TwjLhtznVRg249uUwQ2I
 E2GSYWCItzsc7vZTNap6bp/3i+chnZTxVgSDNKWD8OYvuZV9NxrCPAUEhZbF5HOz1mlDt4Cizgl
 Pky/fD2/TxrS7NH5HHg==
X-Proofpoint-ORIG-GUID: 2ThFxyZZVCD3bwhEK6kWvVb0gSmt7JKS
X-Proofpoint-GUID: 2ThFxyZZVCD3bwhEK6kWvVb0gSmt7JKS
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f8ab5e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-unqIoNYWpxd40M8HO8A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_072119_362384_16C6C139 
X-CRM114-Status: UNSURE (   8.44  )
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


On Mon, 27 Apr 2026 13:51:41 +0800, Baochen Qiang wrote:
> ath12k_dp_rx_deliver_msdu() currently uses hal_rx_desc_data::peer_id
> parsed from mpdu_start descriptor to do peer lookup. However In an A-MSDU
> aggregation scenario, hardware only populates mpdu_start descriptor for
> the first sub-msdu, but not the following ones. In that case peer_id could
> be invalid, leading to peer lookup failure:
> 
> ath12k_wifi7_pci 0000:06:00.0: rx skb 00000000c391c041 len 1532 peer (null) 0 ucast sn 0 eht320 rate_idx 12 vht_nss 2 freq 6105 band 3 flag 0x40d1a fcs-err 0 mic-err 0 amsdu-more 0
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix peer_id usage in normal RX path
      commit: 0e1308803d2c3fd365a6d21e6be355ec1e28eaaf

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


