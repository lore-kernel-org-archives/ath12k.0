Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B3606A8A2
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XWaMhPNp;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWAaoHof;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYyCzZhR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0RJPk8SLvdkt3fyzqaAjIp4rjtW5BHhAxUCLmiMdDNw=; b=XWaMhPNp7fJR46
	Pk+1xMRPceKor+7v9t7ccDS/VcTbwHvpZjtWnvOov2anIXtRT3RsMM8SQEeic1WzzNRMQT5fIW1g1
	LRPm3DUeNDgBdqvMZuXGiulpxdbsISQqrSFVFR47pXNJIdlxhSDBx2BqeV+yHpTE+bP2Q53Qkfdji
	mZhO65PxomHxRO+0hGphfutmIE3cwsis2/9qc0XLrDaqWVBzPNiYBPkcWiHJr4fk3nqzfy5M3eK6K
	RIClEOVZBXoCAujKV3LgA3cU4GbpjU6fakI0uwGheW1cdITSbx4T43z4FH+H3r6hM/d6xwHjRhAMs
	vx21ziS4TQUd4roDLMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAaU-000000077Lk-0aRd;
	Wed, 11 Nov 2026 15:50:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAaL-000000077KN-3ZWd
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 15:50:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0JPW3289946
	for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 15:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RJPk8SLvdkt3fyzqaAjIp4rjtW5BHhAxUCLmiMdDNw=; b=OWAaoHofESkKqYr+
	QQUiSamKGhM2wrRfgJs0QpvyHxK2Wit4dMv+6UN4ducnucnX8oNxnQdI9jUlEwgU
	TEeaEqB9q17laLLJY+Dsm/HRA2DKPSqLdRTMM45EDdUb5dY0otEIaWFa57O/62d2
	5ZgUdQo7F6t1TfAPp/RI0jqo88sLK/ozc3JbKJObUYdGqx+sEAV0ap/6rUOcFaR3
	Fg9DEAQ3gW41Xyr46hfbkOGzKdkOZ7HIPvk+KKxwG1X/saXkjUweFRCFsNY1Tpsc
	gwjx082OHKhVxI4Fl+690P5ZbfzJYhI5rM7lGHzn/pbGmQpcCTswDUaGs0321LIq
	X/csBA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt150fhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 15:50:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36fa5673fccso16285eec.1
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 07:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794412204; x=1795017004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RJPk8SLvdkt3fyzqaAjIp4rjtW5BHhAxUCLmiMdDNw=;
        b=GYyCzZhRILAwuAb0ey/9PqwIoNVHVOlkG8QW2x4U8uawhMOeCvxC5AaUdqXbI81ITZ
         /w66CNoyuQwCR9gwf2e/OZX6GWtdp1OQhSI4H6zyfiSRaP+Aa/6b0L2ZuQBSLcPbkely
         7hTKME1lZ62W92dICHQ86CtaIFXo6SnM8ti0yN2ihhENviKCDDSQCzzsxrjTmhw82Gyv
         tnr+bEIqFb1jHT2N6QREYRhbjTs+OS359BsC6AJ0yJPUk1WAnUckdrO7R/X7CSChUa3s
         AMalbcxZ79RuWKaspjpJeEaneoyWcBamx9wv4xXJbdCmqHbcEAixOyt88IRlGiomkrqV
         ClUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412204; x=1795017004;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RJPk8SLvdkt3fyzqaAjIp4rjtW5BHhAxUCLmiMdDNw=;
        b=o7u0blm93+DJxeWb/e7YYx4Z61yNqbbrksoiCUaCmWDYB7PTGNzdvw/wkog2u2KW7p
         TF5mwpFTqY7tMr28U+OZYVvecrCKsLKuB9RfCUAxkV8H2DjgdhWIBSIba11YM0iCrRE2
         Qmu8tkNYhANINb6pYBTYHsjRwaJ8psQbWW7Ud3aQDrw07HbJ0krLSlqZQiaY3L/HJqbW
         GBqn7y01evgJERcocJep++kHIcJwAd7K7kqFdKvMQ3tqxxzcgJeB+LfkpMt9w1jzCYWH
         8kv3dfCXm71zmCaObR19dwvKdIMdGBLmaoRYJxu9HCX6nqiEq14xeAjPejqYxAqPkmw9
         eqZQ==
X-Forwarded-Encrypted: i=1; AL+hErFOeiZpgCgqBnAZ3msAbC4gvwYXNi+FIhVI6Ad7SMpkFPOCL6wsE/sbFMVNoFC05VynhpTHWs0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/pCzq7/zll3YXnn85LtU4Eii9NnaQ1hSebPTxsVaCLn4U8vo4g
	6KmZe3aF6da1CqUVdxoepxK3LDAcpOXF/KKhkU9Itofo8xOoowb8fMs4CH7P25J3WMCWorKD9du
	HrrKKw2KCii0876cnfD4PTbFrKER2akh0ARsm9M/gvAsBclklYAh19ahCadtCuE3J
X-Gm-Gg: AYBFou06xdHmZh9Rr3/iFs5nkX7RtFiqTLTh1DYdySsPiM/XdTgJ7gmvPd+YrK71JaV
	Sl1V3JPONYMSJGaF9JtKM4Dt5eY0jm1uk9paqv97rumpVLFeIcf0QqyKmEj8nz+MLmDppllIu5b
	IkD//lyMSYlc8S7uI4ZkCtuh3ZG5Dh3LnHaWaprJ4bQUkQmhhjdsd5wzbgWv8chR5Mg3QOgffaY
	ftdVYcISBwoxPdgJLVA1fgrmIhTwnjhHh+zEsKaM4zgXq3/u4brAZdO1YH+NSy0XpDLRr2NYGv2
	xRO9BNv4Kh+QnUlT+DJ/JCOk6JabL4HP1nDbTQpFvOkbpzQtZZXX81FDqU4uKMwV62rTH2T2Bn+
	Ai2eAEzCN4AgMjXrQA7lo8MkDNeJDvEeP19NRdI9RPUURsvpCYnvmzWeV8hALspzehxcSsu5mTj
	rYJTPzg2qUDCSumqTzZk4kxx0vfB8=
X-Received: by 2002:a05:7300:8345:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-3768076cbc1mr3090692eec.0.1794412198577;
        Wed, 11 Nov 2026 07:49:58 -0800 (PST)
X-Received: by 2002:a05:7300:8345:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-3768076cbc1mr3090657eec.0.1794412197707;
        Wed, 11 Nov 2026 07:49:57 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm33704924eec.29.2026.11.11.07.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:57 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v5 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
Message-Id: <179441219693.2984996.8197765482872032821.b4-ty@b4>
Date: Wed, 11 Nov 2026 07:49:56 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfXyBrOHwJlEikS
 yEMTxUp6JTYCxS1WKnoIGVJApNn1lCcdUoLzSG2TdUDa1sW9S0VH+YjTFIaR+Ub2/xOUIvNm5MF
 m+9w/8cf97yrZ0fiheLq0XwH98DLX3k=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af48eac cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NfwiDt4suf8GamiR3usA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: qLlZO4p6yiFWM1tA8UpA_xsgrKiufbeb
X-Proofpoint-ORIG-GUID: qLlZO4p6yiFWM1tA8UpA_xsgrKiufbeb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfXzkxFryudb1sF
 2R8d2G+tJffEdE1WoPC+tdcxcL1SqlqC/H5X+WsfOerqm84EO0aMvsWtONVZXpLBsnTEey/sXHJ
 wAKgeDhhw2Pv02jF3oknVDQCfT20KYJgMvW0qcwxbe+++uJxmQyfvMMBwKj68O5jwVQxCkWTmPg
 2RxfxQuX4VK3ybl7z9lzMMIkhJ6U9wA1feLXjWaDZSeDh5/m42hbIoKE355Ml65X6kqF8DicbbJ
 gzuZm96c9W7q1vy0RQxKKtdVTFwacf5YSF6FkQTeORuU5ogjWC8e5gUEZom83GJrsS6ut0i76IF
 EHzNl5/UBR5/aQnYHq3GLHxHj60o2bHVNwF3gKeeYmRJ2WVwT6dlbvOQvxwxQH0ffofsXPTUYXz
 cQbPHpxTUbXcfTI0Tbg1M24ye4zJQMPzV4+JtQQeqk6MKbp4bxaro7PcR+Av3Gd7MWce3uRNZR9
 jDftwKmuZKuT04nD7XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_075011_060367_8D5B7A62 
X-CRM114-Status: UNSURE (   9.52  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 10 Nov 2026 14:40:21 +0800, Baochen Qiang wrote:
> ath12k currently relies on hardware link id to resolve the link peer. This
> works for QCN9274, IPQ5332 and IPQ5424 but breaks WCN7850/QCC2072 which use
> logical link id instead. Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX
> throughput on WCN7850") tries to fix it using peer_id but actually that fix
> doesn't work always. From user PoV, current code has datapath issues like
> EAPOL frames getting dropped on QCC2072, and finally MLO connection failes.
> 
> [...]

Applied, thanks!

[01/11] wifi: ath12k: fix potential OOB access due to unverified hardware link id
        commit: d709315edda1fe0742e1178a6085e1db69416af3
[02/11] wifi: ath12k: skip hw link id match for devices without hw link id support
        commit: 43c38c0b197818dd40082adf4348f8ea75fad338
[03/11] wifi: ath12k: rename ath12k_dp_peer::hw_links to link_id_map
        commit: a83edfa5f4942b61aa4f268830a214cc79d41b9c
[04/11] wifi: ath12k: rename ath12k_dp_link_peer::hw_link_id to drv_link_id
        commit: 6a87f77b0e83dbbf3e4de6c5433b91890f6cea60
[05/11] wifi: ath12k: rename ath12k_skb_rxcb::hw_link_id to drv_link_id
        commit: 19e67969fe60006503d90fa6f5112f7194e65a59
[06/11] wifi: ath12k: derive device id without drv_link_id for single device group
        commit: 97be8e94bda1545424ab6e169683934e97528c56
[07/11] wifi: ath12k: add support for HTT_T2H_MSG_TYPE_PEER_EXTENDED event
        commit: 33022996c0388876a5f2a484b25014b61c63e415
[08/11] wifi: ath12k: allocate logical link id on host when firmware does not report it
        commit: 71d642bf03856723b1c16757471d7873e561d4c8
[09/11] wifi: ath12k: derive REO RX drv_link_id per device via HAL ops
        commit: 050f149c9ec26dc9f90c83940fb6561a06b3203b
[10/11] wifi: ath12k: derive WBM RX drv_link_id per device via HAL ops
        commit: 1828f610802dc5aa9ac0eb40477a806cb02215c6
[11/11] wifi: ath12k: use link_id_map to resolve RX link id for all devices
        commit: 9347a4fc49f3cba3e458e4a9a3fb26e364af2b54

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


