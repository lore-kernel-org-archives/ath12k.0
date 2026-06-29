Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3F3C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 07:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3qdojYutaM36nMSvUN9enc2D/jGPsCfjBQ0NFTNC1w=; b=ibwJP7XK/8QXAL9XoeatyahlG3
	KAPHwT3TVkJ2c8KQStn7iYYXUqPyOOQaqWaAeiny0OhZYzMn9qPEL3yJWeEmHd0C/gur7H+Pdw2Ct
	0HVzSgBNvAGeU21546jCJiN7+BxqsfO2U/fNqaAcTA4/V9pVoJhMRpvSlm5PDuHlULkxEasBF7KC0
	qhubvsHu8jrBJnvR4Yjn6Iqf0tsf9ZB9qkR/RoWj715SGmIdOJsk+UHNVBDC+onVGEBtPBP2Q8le1
	7ongux989y/i1/ZS7BebyGxnFNMvud5KMVWknVl83SCtvQ8pBQLd/ecUvwxaCxwoIWT/ut6uIUuyN
	6yfIlEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we60p-0000000DpqH-18Hk;
	Mon, 29 Jun 2026 07:02:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we60n-0000000Dppv-1N7H
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 07:02:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rFcU2115235
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3qdojYutaM36nMSvUN9enc2D/jGPsCfjBQ0NFTNC1w=; b=FdHDvbEtRPRww5E3
	zv3Lmr4oP9ce8pAjWq4ofwnNPIlUOkWwo474dQocjfdlWnuXjwirpaVUBxhv5ySg
	C9WzHrdc9HU6yp0TA+Kl1pBX6vr1MwB/Amh9uYIqHIXutfXq5R11jTjwk/vRy2NX
	SgMtHWgluPWoCL/OJf5W5qK/nv0hfoCSzhJlJYQrpnSoYDXZc1NMrp89952YUYL3
	UJ/rRftKsXKjoO00yJWsvY+VSAjbAhHExqDqqRBjC7QKD/y3C60sDmUU/fyRXz83
	3CXHwxrDC89uSn/w2QqXN9prZwoMm8T5pEZQd3ymaKWnhTsExDHJrKOVPLRFXxt/
	xVxt4A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734d73m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:02:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84786d85ec2so339383b3a.1
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 00:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716551; x=1783321351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3qdojYutaM36nMSvUN9enc2D/jGPsCfjBQ0NFTNC1w=;
        b=CpOolzRV+/t4svt+XL2Nwtc2s1b1hoQ7wnuhMuDOFYfwdtHjkCM/Dx0AaQZCaEiqE5
         ewHgYA3Ax1/PzHahaqN3tpUJwaDkdihJC59+IRpUuWwUbmZTMLW5d1cpXnELurT2uY/e
         JduidhiVrpuQoE6peWShOyfVES+yJDs4rKp46U46omUCLkF69oSWn8/0O7JsM+ssSFzq
         0NPrx1f6n4xYGpdl3MkOL5bDXm5gIFa7FBf9lvFJS+Vrv+ErI7FjKQgLeXmivUKXxxVS
         1aXVqD+YYS30zd8x4+EoU7eKgfH+mmn+MrrqUHB0NDbLvCX08QI4RuxvZmj2aYO1YnMc
         7f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716551; x=1783321351;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3qdojYutaM36nMSvUN9enc2D/jGPsCfjBQ0NFTNC1w=;
        b=Wrj7RPjYcGr4ENY3fQxzKq+PypfHGjlss2Oz+WYDvNCqxBmFi4hz/gVBfyUIiNMpNG
         79EGdT4JNgnyfulDAUzT+ZUJbRD5TFYTYBLgpJNt21/cgE3n2jy2pv0sYB+sM4+xSng2
         1AGPY9eVdBaqg2ChEoabhKGAbmufxU+KW/DLRgVWMylYCRSpsj0FGEsWqyAbyM0aporB
         7OafJcfOP9FbS+xUcCaEmC4oU0GE7qz10jUQSDyh2b6NwWAUbPzlBfdz3iPohdjiy4s+
         N/+JqrqPb+ZS14M36f9OJwzpiOzxKMtRIsAP6zgheQGrhD6707VuSq6aL6Rt0vBiB0Ap
         q7+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq41AlPO/gVeu8E4OITSf1Ov8XkCpX6tcrgVOiSks6wHA8OIfp+NsyQdl7wjuHmkMx6Bmu9fe4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbhbtXK4nsfh5RtkT2TwNxE82bdgnEyRgw9pQC9V2XUWH7VW5Y
	qPc4xn9+NzXbnyKOKcyiX2BXuhf1YXCvr3MXmmr/0byQkrdx6N/s7Q4Uk/oqgHwjPB/aH4w8or9
	TLrnTZ2iNw55KfxuRpZS4YdNS3O+FmYsxQI+VuGaVysjlZ/gFjDl3/alXEFceEkpuzS4HcmvGs6
	4=
X-Gm-Gg: AfdE7cmLliJxUmE9LVV80Z+xhLmZJWizTMGjZ4qwOvhDqZSYYBWSEQhfQIehatvYa5S
	rZ7IxeKuq9SI2G8/O2EKT9rB1qS1MKPNKTlmtbz7Uh3TXt3Xv45djvl1nmbMm28HJc/rWxBA/o+
	3QBlnioyi/Bwn4d2y/veZoupTOfocKhRgJe9n9AsRqY7NGPH6gpHgZxv24d1DDjmgeT/uQ8LDJF
	3zeztOv4KInvA/sKPzcYRIMz9TMMB/u7ICZ0grqbuYjU3Q0Xh0PplrWjKB6S95ybPlWp0PJNrm1
	xD1MJmqb2320Ozp0prSsuoGvWDBsLU3tUdJpty8ZB8WkcTcEWFfzbVh0PfknKuokP6O2tPoSR67
	eCZtl2Rf2Sh/1yRqty/25Heu730ndYcAR0mIVpeHxrZwfamfgwiv7hkQx6U7bH0HItN/Dwp3CTw
	f4v5b6Dw==
X-Received: by 2002:a05:6a00:801a:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-845e8b915a7mr4702208b3a.13.1782716551275;
        Mon, 29 Jun 2026 00:02:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:801a:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-845e8b915a7mr4702183b3a.13.1782716550814;
        Mon, 29 Jun 2026 00:02:30 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fec0f7sm11106095b3a.22.2026.06.29.00.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:02:30 -0700 (PDT)
Message-ID: <e4b3ad21-0bdb-49bf-9c41-8ae0d0f96c0f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:02:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath12k: fix dp_link_peer dangling
 references on AP vdev rollback
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260629-ath12k-mlo-peer-delete-race-v2-0-362b25590d19@oss.qualcomm.com>
 <20260629-ath12k-mlo-peer-delete-race-v2-1-362b25590d19@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260629-ath12k-mlo-peer-delete-race-v2-1-362b25590d19@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Yg832BFqom7AVQVDQaj6-ZYG1E70Shsb
X-Proofpoint-ORIG-GUID: Yg832BFqom7AVQVDQaj6-ZYG1E70Shsb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1OCBTYWx0ZWRfX//FHjjd56H9Y
 Sfg3zKuPY22Cmqaq+DMDcGd+XveBw+uzRUD3daw+HhfNpg6udtuItJe7M5SS2q6tTi+j8QiuGdc
 OSHRhXNfLi8uJcY9ehNEfFwJQ93ZR74=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a421888 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_EJcpLEw30hKsFGvHqkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1OCBTYWx0ZWRfXwa5HrHvRXVqh
 vMKyFxlxOK7Gx0Q9sdmnfSEnkxWWKcXxBUeA6JldmA6F2ixe6LvHtGVhQOVjRzgl8OyTuc4XDq6
 85o/Ulmk2U+AGeigcFlvvGmr1jvNgQGC6h3HV6WPbquR39jNHLyD9cc+5xuX4ByhIZdsk+KKpMZ
 zf1W2Yk6XkSWZ5DPOoGaWM622pM1iul33s1HoLSbMSUmJ/8ksmSh2LqQrqOwvdsRYG8AQuwkwFA
 zgGTf0iqE1UvSzaC3T78y9W8n5NNTBan8QkBj1NEFZjDswAM00xJZdeUw87y/d1JOda+mzzapLe
 E4nZmv6IKa4qqIFRybrXpbS6LjH22SrnqL14nLzmUkwPvt59MWFj4UOyIFxvHcB3nCDDIdctofE
 jEHHgbWOpReg0uI07DnRpo4lib5hmc0fch2nHGz0Am3U/kz8uTXG22COQNpAU1yD0bqLoFOo9Hb
 M2CZdjVf5JjGxqQWmTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_000233_486870_3BD3FF8F 
X-CRM114-Status: GOOD (  15.07  )
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



On 6/29/2026 3:01 PM, Baochen Qiang wrote:
> ath12k_mac_vdev_create() for an AP vdev creates the bss self-peer via
> ath12k_peer_create(), which finishes by calling
> ath12k_dp_link_peer_assign() to publish the dp_link_peer in the
> dp_hw->dp_peers[peerid_index] RCU table, in the dp_peer's
> link_peers[] array, and in the per-addr rhashtable.
> 
> If a step after ath12k_peer_create() fails the function jumps to
> err_peer_del, which open-codes a WMI peer_delete and waits for the
> unmap / delete_resp events. The wait_for_peer_delete_done() path
> relies on ath12k_dp_link_peer_unmap_event() freeing the dp_link_peer
> when the unmap arrives, but err_peer_del never calls
> ath12k_dp_link_peer_unassign() first. The published references in
> the dp_hw RCU table, dp_peer->link_peers[] and the rhashtable are
> left pointing at the dp_link_peer that unmap_event then frees,
> producing dangling pointers and use-after-free on subsequent
> lookups.
> 
> Replace the open-coded sequence with a call to ath12k_peer_delete(),
> which already does ath12k_dp_link_peer_unassign() before sending the
> WMI command. This drops the published references before the
> dp_link_peer is freed, in the same order as the normal teardown path
> in ath12k_mac_remove_link_interface().
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 5525f12fa671 ("wifi: ath12k: Attach and detach ath12k_dp_link_peer to ath12k_dp_peer")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

forgot to pick:

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

