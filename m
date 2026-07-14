Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7026C4450A
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 18:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZMUNvcBCyxke0yxKFU8VZ37EGJlqlcJjNDq1EWEOm0=; b=RJKTuOmRtqb82HJM/z6Nv65ng3
	eZNEW4qGizNysr7CgwZPL9eFR9RaTsizU4ahGXP1dAT7yQJu+SCR38eGsQ1jUqGu6XKszSROgaR9u
	nahvPFvGWZrYnDL81PMLqqpz+vL166NuLCz9trxx9uct9eZhVfROg3BuYBOM19+WOsdDQRSZn/QAR
	ihb4zJBs14cj/JPUVR52TX6ma3iwyY1ndORVAyNl8cKhSuJfSOTysB3ss9QmluCX63HyzgVEQhfY4
	Qyvhm1l/krqtJ0juyZMa8UJzqqzML7IpGZsqpo7mM3AqyUDf2m7QzcAzHQCpeg7YcjHdax3II0jXp
	rZSC8a0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY7-0000000CqBw-1ONQ;
	Tue, 14 Jul 2026 18:08:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY3-0000000Cq8r-1psY
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 18:08:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6ukE975509
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZMUNvcBCyxke0yxKFU8VZ37EGJlqlcJjNDq1EWEOm0=; b=bSUET4e+YAG/IMSz
	AnzvN0I6RZ2Rq8YpTBhzuncKjc28JaSKDPOgWMwM/7jdaI5lZukDOQZ7/g/emMgj
	AkHGhxLU0+/exZSbCOyQvt3mAYwcZ94p22eoHOd6k6n2JPBuZkVhGXRm3VzfxCG9
	sOpxm7sNKnH7PbyFpAF7avE64+0q16rJiVq+ze6BRxhOH1W0STvnP7m0L/QuQojl
	4XcZFJq5gNmL5CclnwX9fJkcDI+GoqwiDf7WODnWtgL3XAizEuHt0rWWgH2ew3Iv
	f6ZkZ8je2eVf2JXsc17wR8qeX1GP6lcTPZWp+CDM/bYEmnPZl4bK1pabZL8Pp/0M
	vWoh6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2k9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92efd2ca21aso595103985a.0
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 11:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052482; x=1784657282; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZMUNvcBCyxke0yxKFU8VZ37EGJlqlcJjNDq1EWEOm0=;
        b=e4iCATQoBta1722iADI/kJR5Bu4Dhkm/LOqaLFtJ6rfKpn3V1GS1obmzvcwk3RQD6D
         amDIv5nwXuUJ8CeHLE6FE0t2rN0ydGOC/lPxz8p2H7CwzFIMCsJ320wv5nOtjTJ8lTfS
         +ZZ6pBj7a3T9ESPECrp1T1JIdWuFucBJwV7FNS0OFVJkGyja985+I6riz/zbut7MVja1
         W6xo4spnrFJe2ceQ76C4+22CIvIjecXPXQwfxRJbGZqOBKq5QT5f3bWhd9jT9x+WSbnC
         x3xsfFNxU83xQN1sxqx4vE26jbnV27YiAgp3HQAZAoqxLtQ3bKx0KxOWKJT+XyVPooff
         4+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052482; x=1784657282;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZMUNvcBCyxke0yxKFU8VZ37EGJlqlcJjNDq1EWEOm0=;
        b=osiRRWHEFVvdKrzLd3pMpkeOueBrB12zD6JLlc1d6IJ+OxU7o8oBG2CCIUs2uVEqp7
         BTRGmIIOU+NL8kNKlwdiBFUWQ/YKMPGSqOKs9PIyV2aEApq7iyYLtBY2zcM31GNOadGs
         N9Ab/HSQlsjVjUEUCQRNXiLjYyuXWzCur3hSRuP/9b7N44oX1kDI4WChIeC9rNppue2L
         HRv8GD7Jhte+B2DEIjYC3VzqdmVYOttZhfZkCgL7IKDvAkKTPwVszwQtRJzlPEQtwHll
         IMZQLAtItjjTh374Y8cEz4/JMlx7Emdmazwfzcj444svuvpLPMfPKbDYd2WZ0Rc563vT
         1SaQ==
X-Gm-Message-State: AOJu0Yz8PtboL9iNEe+vZ4p/n/Hz8x5pq7eYYdzgsPDkwX+u7oJATKYu
	yBgyc8gDO3HUIG9YBB/ZSVHOuwc++uR+yHPNplQAhtljD6FubQi+DUzabkRUXtij9i4U4mCbb0t
	Cv3PhA6i8rDX7//Qxe33182/Qy1+g6A6Y7gHFZfBd2yP8y+5SsbVHQL7e9/W4DP9T
X-Gm-Gg: AfdE7ckbYtxWdtcckAOARLpcFtyzp2TyEjApjRk6+WB2JL4/IwcAesvR8RUmQbNSrPm
	EuDXIZzUA2dGKt3uSL4tJ4kuEjitsTjYVlJW4R5sV5GFP9SNqXNTXrAKhAiP/T4SNyZ121djYtl
	vi+YKoXf//59vwJAAfB+OcZ7gpeUTq79ef/izxcnxe8xg1Mu8NNS9r1kM3ebMZ6eE5wuAD8bHGK
	/L18Z0wf79paFuxsNGbkARiBrBvTTOGrCGSiJhDrhXfPASFTDFT3jOcrLDZ/mpGLW1FacyFhbWj
	1SL7kGR61cp249aT3GBBnidZSERKDl7d9JaOS7IsleDaIY5u/GT3t+y9/xqrYtB5KNahqq+/HJn
	+aAFpQofPwsAqloU/oGW9nILvBuup3x2Mawa/IF+vtftxc7XixYXRLP8L+m4KPaFewA==
X-Received: by 2002:a05:620a:2549:b0:92e:4470:f6a7 with SMTP id af79cd13be357-92ef2b96862mr1443490685a.10.1784052481911;
        Tue, 14 Jul 2026 11:08:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:92e:4470:f6a7 with SMTP id af79cd13be357-92ef2b96862mr1443486085a.10.1784052481447;
        Tue, 14 Jul 2026 11:08:01 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:07:59 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260701182428.906441-1-tamizh.raja@oss.qualcomm.com>
References: <20260701182428.906441-1-tamizh.raja@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Set
 IEEE80211_OFFLOAD_ENCAP_4ADDR after tx_encap_type vdev param
Message-Id: <178405247932.4102418.5292586403091961512.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:07:59 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX4pKtMCmAUj/E
 gMLbmNqbx4E7Y01IiXDA2hhQpKFj99QRWQYnneS0Vfl56xffUzWNFTLUhm+o/9xcdK1zcNp3Pk7
 tyG1egChSqjwVaXV+qbz2cFVlxMy/9KiGIpeBcreHzV3x78Py9t1lNc+ayoFEIzQe5gOQfyJqQK
 Az9ln/OF6+3YYvGZ1grr5fBM5JG2Qzij8bKTrK0cjAVQTR2ZtEHJue4c9jMIk7rYy47OTnRJZdu
 sLfVYvcfZtI/dhNinwCq04F+qC2DK7FDhouMjL79B4ZMjTBzEZB6g0T75rjzVZgpTsPI2RphVCs
 M9z6ZTX3awl/UVOV8Tnb/7PZ849z//xZk8DWl0ezTMSGwM6IozLn4+X02ui6kRBKxkEVWJWslkV
 d72nni6xAzjptpdXNhKgCxQzR8B8O0rOLbQrMMdDHlq2IiTj1zfb72R2TEkuySY1YGyqC409uT3
 I2JaFFp012+iivF/o1w==
X-Proofpoint-GUID: Y2jkJ_tE3SlgKIxFUtOn5CL7iinXmTDg
X-Proofpoint-ORIG-GUID: Y2jkJ_tE3SlgKIxFUtOn5CL7iinXmTDg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfXy2ZNptqu9Mha
 qzGAvzjJUx0/OMSQMn0tP47t8ML69CEb4g7XAgqTqiS7Sq/wVhzr6a18mv2KoOGSzmKeI/0CXJm
 dBDQn0FXGdyftMM789je5UZUZCP9C+U=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a567b02 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zMGBYq01FbGhXOOdeYwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110804_872510_DF70339F 
X-CRM114-Status: UNSURE (   9.90  )
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


On Wed, 01 Jul 2026 23:54:28 +0530, Tamizh Chelvam Raja wrote:
> Currently, IEEE80211_OFFLOAD_ENCAP_4ADDR is set when
> IEEE80211_OFFLOAD_ENCAP_ENABLED is present in vif->offload_flags
> at the beginning of ath12k_mac_update_vif_offload().
> 
> However, if the WMI vdev set_param for tx_encap_type fails,
> IEEE80211_OFFLOAD_ENCAP_ENABLED is cleared but
> IEEE80211_OFFLOAD_ENCAP_4ADDR remains set, leaving the flags in
> an inconsistent state.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Set IEEE80211_OFFLOAD_ENCAP_4ADDR after tx_encap_type vdev param
      commit: fde37c064641a4bad26d1583de25f6d491a7a9bd

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


