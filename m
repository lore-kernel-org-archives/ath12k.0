Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59CCC369A8
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 19:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SIVxRBGsmdBuK29DViOG/pwUq9pv9rU1G74T78se3cY=; b=P2WWy3+1VGWNcFQpHkvkddru4f
	z1hnL9YGaveVOqvt+VFZ+U4Xv/4T+NenT+dqa5r4fDOjesk/mqKcB6j9iFVbOHHt4jxLTXnc1bgnc
	WErR6UKEsMv8vxpOXYrFeJxVhxuXiSy77Djq4J2Kv1iI+qwcWzj6IGyOyWxhjRdlXuwSFGM75r+OO
	vtIIjxaVEwiriaAZbX20nZL01bNBb4CAlof0bcddn/PdFDBBu67p60QzIaftveZrwfGzMnXnIQWlI
	1GP1cE1odqx/ikPd0+QgUvjezblUfyWe3/slYTupUTz5xeYIMYeFbnUDykUD+7lws9Wtfa65aTCfI
	e9W6I+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F4z-00000005Hdw-1pGI
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 19:57:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dwf-000000059E6-2ZYC
	for ath12k@bombadil.infradead.org;
	Tue, 08 Apr 2025 18:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SIVxRBGsmdBuK29DViOG/pwUq9pv9rU1G74T78se3cY=; b=hlZf4r6CX16yxBhZ1+u+kKWsj6
	vZY5IoOujFrq/4QVsRQlm4cFgktv9pTJagyS/skPq7HOSRxdzM1UsftH1WYqGFIAz1Dh4F3nfD/3J
	20KLSejmdGO2fGfJO+fPpoC3HSaaLd9zKET3lkLooB21OF1Nxd136CLy++Cdo8vFIphcQ6XsBTMAP
	NGVeZQupgCbuxFO79oqJ6/Ov4rCDvcVF6rB+DLrAVhZi3m5Fg0v+T4Vuen7xhDAg9+5qR9sBEQIFJ
	NaqIu6wnXs/Ey0519tfnkVgiWcPxPg0p0FRQ5vo214GKh1KR46zAOI+3hyLCrf2f5DvyvYuLKpZQ0
	8MaVqEUg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Dwc-00000008OVc-0sej
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 18:45:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Ab999027842
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 18:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SIVxRBGsmdBuK29DViOG/pwUq9pv9rU1G74
	T78se3cY=; b=omMZ1/RjTRtTgqfBIhDvmzOIrWmSHQ9MKi5gZt7CzIkD1wiEVaQ
	gVEhuyZCeoAlHCrdSgN3EdxAMDWX4ZFvfck1UVuf8xoiAJA42gx5Pp5BqVnDsLwb
	yjuvdHgJxSkM5XkY8K/wjnA/KrIz9EsJIRDVMOWL3SC72PnVoLGktnBmh96oReNQ
	U3pSo8kW2C877iddvgWdbFjVZURBKR/gPvKXbFs4o7EnH2ctv/AfuVddx3laZDvu
	zBNeek6ugRhaS/uXaO5VMOZWFltBFw/cG+6Rn8LrfbuQcuDWNRG3b3WDOYVOwqb/
	ny/oP1QZPi23DbJaIZ3RukpoHopsHvAYD8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd00x8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 18:45:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so9138173a91.3
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 11:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744137903; x=1744742703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIVxRBGsmdBuK29DViOG/pwUq9pv9rU1G74T78se3cY=;
        b=Wv7+/QyNqV6xHkn2tkHmAbZZph56AEh1voW80prCEq26jyjQiziZRpVF6bSMk7+0zP
         KSn3CBerGi0r1WNy8VKvjxz/ZHb5kKsg7F2y6dMCtIfBaaA8cvt5a12iyW+6OaZlBxwA
         jpucg6uecNxbwE5zn52N/YrHZ+VL5WF2JZl4l1ICChwO8eBs4MnudrOW1vZhZqv2Lm+R
         St/ON0GYFpR83kg2yUjcm4xLX0bwczfJvH/T9cESs+5SJDVX+pnoNRGdJ98xPpM1Cve5
         QMQKhauVJYdhcbGLIw//7Gp3v85RWbCZ69LHK5kfX4zQmUMd7nQ8zs9zQJkYNk8wSZwb
         akAg==
X-Forwarded-Encrypted: i=1; AJvYcCVYKlKfrQDb06W1iyvImH6p8M0XDt5n8Uz8EHlczaXKuzayNGRDPgM9icYOdlBeWp+4Zj0T4Ck=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbEPz0wFRCoxUCVBsiNvGoJ/YMUKKWiuyY5YcROyEUoRV0FOqv
	+p/zXPMIVRpK8r26K1TqWRc5TrbXYrYsqsIp0BYaPnjve5uLTNTGfg73okgHHHDTefV9Mu2zT4J
	rNzpzO+ggdvqmevlSz3wWB/zDNiQTRwZfIS4Kdqz1HYIdUuke+TXPmOcHGFEq
X-Gm-Gg: ASbGncsPPEGF0M73zdVPIc3UxiVEzukWsGD/H6HkWFp54efHkOWqIrd5MPYaC4OXM8F
	TYFzcOYtfDNY+S/uUIkVUQUCZOYmdyBlBXw4KTv91MA5UiiIiwCO+R9O7gyqMUJ0523SeDGEird
	aclYUZcOI49oPRiOHb6FNeOK60ArRdL5FU0CoNFEHHO0wdwvMxt1FuM2A9a9PT0bm17HOhGUJa7
	LBg3e6CwfEhmx06M6DzbWF4YN92MTOFFz2QfkqI/QLYvFxG9BrLI7gxlX6Sknnv1tDWJmahWBwy
	sE03BFCUigDWetqoIhFqHBz3uuOkT0yjGydFWQdLnXA3PwpuZDehxREneBxPi7siNHQSMVU=
X-Received: by 2002:a17:90b:2e10:b0:2fe:b907:562f with SMTP id 98e67ed59e1d1-306dbbb087fmr381994a91.14.1744137903115;
        Tue, 08 Apr 2025 11:45:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJtCIzuK9uo5RZ62/Jh0bNOIUJJoLqLmoyZDpvz1C0mc1efm2PWkfeeQ10I20AY8Qy8+ltvQ==
X-Received: by 2002:a17:90b:2e10:b0:2fe:b907:562f with SMTP id 98e67ed59e1d1-306dbbb087fmr381973a91.14.1744137902729;
        Tue, 08 Apr 2025 11:45:02 -0700 (PDT)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb9500dsm12882212a91.47.2025.04.08.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:45:02 -0700 (PDT)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
Subject: [PATCH wireless-next v5 0/3] wifi: MBSSID support in MLO
Date: Tue,  8 Apr 2025 11:44:58 -0700
Message-Id: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1F1EcEL2TqwrYx-9v6wY-PYYLBoRI2sS
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f56eb0 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=XR8D0OoHHMoA:10 a=MnmnwhSU_71rvZYfISwA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1F1EcEL2TqwrYx-9v6wY-PYYLBoRI2sS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_08,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=463 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_194510_590099_BBBC2075 
X-CRM114-Status: GOOD (  11.87  )
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

During non-transmitted (nontx) profile configuration, interface
index of the transmitted (tx) profile is used to retrieve the
wireless device (wdev) associated with it. With MLO, this 'wdev'
may be part of an MLD with more than one link, hence only
interface index is not sufficient anymore to retrieve the correct
tx profile. Add a new attribute to configure link id of tx profile.

Similarly, storing 'vif' of tx profile inside 'vif' for nontx
profiles is not sufficient for MLO, instead store tx link data
inside each nontx link data structure.

v5:
(1) Added a check for tx_link_id when the parameters are passed for
the transmitting interface itself.
(2) Added branch tags in all patches.
(3) Reduced lines to 80 characters wherever possible.

v4:
(1) Pre-requisite driver patches are merged in wireless-next
    hence this series should apply cleanly now.\
(2) Refactored possible driver changes into a separate patch.
(3) Found a change missed in HWSIM causing compilation errors,
    replaced mbssid_tx_bss by tx_bss_conf and confirmed
    successful compilation.
(4) Replaced vif->bss_conf->ema_ap by link_conf->ema_ap.

Aloka Dixit (1):
  wifi: ath12k: pass link_conf for tx_arvif retrieval

Rameshkumar Sundaram (2):
  wifi: nl80211: add link id of transmitted profile for MLO MBSSID
  wifi: mac80211: restructure tx profile retrieval for MLO MBSSID

 drivers/net/wireless/ath/ath11k/mac.c         | 10 ++-
 drivers/net/wireless/ath/ath12k/mac.c         | 35 ++++++---
 drivers/net/wireless/virtual/mac80211_hwsim.c |  7 +-
 include/net/cfg80211.h                        |  2 +
 include/net/mac80211.h                        |  7 +-
 include/uapi/linux/nl80211.h                  |  6 ++
 net/mac80211/cfg.c                            | 64 ++++++++++------
 net/mac80211/ieee80211_i.h                    |  2 +
 net/mac80211/iface.c                          | 75 +++++++++++++------
 net/wireless/nl80211.c                        | 24 +++++-
 10 files changed, 169 insertions(+), 63 deletions(-)


base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
prerequisite-patch-id: 23ab0045d41c493c54142d2698027f21d2063ba1
prerequisite-patch-id: 74c658429fd696e331ccaf3025962d2884756d57
prerequisite-patch-id: 284c1af7e51812f987ceae4e05ff64c24310d400
prerequisite-patch-id: 17f6bcc54efce643210524c984b52b9445104427
prerequisite-patch-id: b0665c8a666421d0afddfdbe6d7db41c657e17d3
prerequisite-patch-id: 817cc3ee76c3fa22fc6822eb23d7a54399cd6c64
prerequisite-patch-id: bb2dfb33353038cd07152fc4859e8b10dc191dfd
prerequisite-patch-id: 999a3915f59eca4995da1061d9e8aa6238f9e36d
prerequisite-patch-id: a505f82268ec8f6502e49a9170b984fb618a6205
prerequisite-patch-id: 4bb8e397fa2a3d0db778a6a59142093b0aa9a93f
prerequisite-patch-id: aa840ba06263db886c7bb245b5a67391f22a4e17
prerequisite-patch-id: c432a4772ec7dc9be76f04d0f9b02db8a49cbf09
prerequisite-patch-id: 3fe11b0b9b5674d6cabe50b5db567a3ba83455a7
prerequisite-patch-id: e8fcaca081f0388638c477923e83b3e92a109dca
prerequisite-patch-id: 7a014e384baa3f587a9a56762f51df65e397a5bc
prerequisite-patch-id: 69f02f74837f521729cfcb488dde8d117566bb0e
prerequisite-patch-id: 1d48b9dcadfd71de63686fb567d51a1209cab958
prerequisite-patch-id: 5fa3f69215f44f19ba7ee17067902219a9affce3
prerequisite-patch-id: 7991ff8ab03c0a8287efdb9e54a808b4c6a93c61
prerequisite-patch-id: 8b422feca8352ccda57d90a49364c0bea20efd04
prerequisite-patch-id: e48b89ab1370463e8db1d797d98982f4e6aa80a9
prerequisite-patch-id: 5c1da3321a85db91f97ccae32cf6c3bffded6d2a
prerequisite-patch-id: 0988c15e49f839a5b1a5b58e6d865455427f663e
prerequisite-patch-id: 762b2ea2fca5d37a05d386c8b036240ef6964bc2
prerequisite-patch-id: fe6492431cb48cd5b3fc34190dfd8a129a76f82b
prerequisite-patch-id: aea177c34c64e725a8ea49de162c494a8f8d4bc3
prerequisite-patch-id: 456149333aeba8e290a02f643ec25a507ac4fd3f
prerequisite-patch-id: b226e7375c86290f46abd9afca9b19bf3b124a27
prerequisite-patch-id: 8b4325a87a91ec45462661ea3470ed90049b6fbe
prerequisite-patch-id: 4120a2bb50ca6042e3d388303e107b2835a62618
prerequisite-patch-id: c18a1f6db675ea7c66a614303411e7fa054e81c3
prerequisite-patch-id: ee0ff2615c9172eec1f0786c98b1e4befbd16f3a
prerequisite-patch-id: 478e6388419e886406dbf23302c7d3f03da5df89
prerequisite-patch-id: d99fdd8ad23ed798281f08c9ef5a93984d3c7166
prerequisite-patch-id: 58f4ceb1a35a075a07119cf4237891ced34ca364
prerequisite-patch-id: fff242eccb9daa9d2450ad1d074588af56e4d28e
prerequisite-patch-id: f0ba1a475168911ca79a5bb0e1c294303861a0b0
prerequisite-patch-id: 3ea9e625ce7d5eaec07e987e6fb0188a4f8df89a
prerequisite-patch-id: 5f81a63d74193cb883db03f8d6ead5b18e58be74
prerequisite-patch-id: d351e642a1f2107c8c316f273d2f923b9c90b4b2
prerequisite-patch-id: d8a3b92f5fecb5b781fe7963be69d49b9e94ad8f
prerequisite-patch-id: 3711a8bb24847dd69c5805d7425416b239144898
prerequisite-patch-id: f6b8eea777d71fe53f60ac005468941114525eb4
prerequisite-patch-id: dd52a7dd54aa5c964c2b91c55677b211cede8bde
prerequisite-patch-id: db9bdd07b03cc8826184f0619b073df11aa65fd6
prerequisite-patch-id: be52a0117ae745d3dac4e01cf97e29807e3310b5
prerequisite-patch-id: 214b49ca52050af46d10ab088c15d3ae0fcdfd57
prerequisite-patch-id: 0b18da4c5eb73a4d6e103871d5c577e61bc01198
prerequisite-patch-id: 17d1c6c2fd3ca0e5cd7e283bb1afa1afd91712b5
prerequisite-patch-id: fc65b56879ea1b7dcac9f100fb2a240f600dcaaa
prerequisite-patch-id: b65186f62f70456a4f80e646a5f656431b69451b
prerequisite-patch-id: 0c516eb530339e5398eaaf8ece5e72dfac419f93
prerequisite-patch-id: b1f6cc6ae066f3e10b5626ff0af3267449d613d3
prerequisite-patch-id: 0369956ed097ba990e31ca1663550a74ce5bf8a0
prerequisite-patch-id: 73a4b0a87c136697874bb120a3bf0a7ec6e54a32
prerequisite-patch-id: 87a073d8b3b4e3cc910b0f712b7448101fae9de9
prerequisite-patch-id: da1ecefaf63a0043c097432de6788d5f9ca5b911
prerequisite-patch-id: 8744ce0f19dbc564162abe788c2680504f9e698c
prerequisite-patch-id: caa8e809ce76651faa280e1a0b9875b7fab9330d
prerequisite-patch-id: b2e0e586c1ba6ffa8b11bd18368cbea67cbdb753
prerequisite-patch-id: bcee14a9b5bae0e11bd1c783141307a90630b7dd
prerequisite-patch-id: 6e6d484433f63d7dbd51411ab4468ba792360918
prerequisite-patch-id: 29d26e0cb33755991e217f460ac86cd676c383f4
prerequisite-patch-id: fd62a57d6c6004c6c0cfd85f0e2eb8c0ab7839e0
prerequisite-patch-id: 1718fbd62dc03d5977d6d8c34db067512eebed8e
prerequisite-patch-id: 564036f943bedf2264253194f5f86b8d615e8850
prerequisite-patch-id: 45ed2cdf77c46966f0126328265bebc0dc7f6ef4
prerequisite-patch-id: f256cdfafcd6b7b6534f2b7cc232a7ba0275105b
prerequisite-patch-id: 990d63a66b7274ea9af0453dc285468c0bde8f85
prerequisite-patch-id: 56bbb473eb83d161b675b2349b48a33b8785a5d1
prerequisite-patch-id: e3588fddfb33c61c52adcb2c112c0e80e2ca42aa
prerequisite-patch-id: 6c6874d0bed7d5441ba7b307e5226a64bda56061
prerequisite-patch-id: 4efb720b481735792c74118ae2698e1ef2eddba7
prerequisite-patch-id: 0a1bde787a5786df6070d319d389d7486a75606d
prerequisite-patch-id: 44ded2ebd394862c0bed18cac6b2e36aed5ce723
prerequisite-patch-id: 63f70964b843488b98c11f5debf9550f618a1ea9
prerequisite-patch-id: 962f20d746fe5fb2da6728fe19dc05c3daa0621f
prerequisite-patch-id: 35d818261dca90392be64c88e716bb5faf8c21a7
prerequisite-patch-id: 40c196e396e8ed415f7a331f5900fb3917ec712c
prerequisite-patch-id: e884fcab280286cbaaba6366991769bd07b2ab39
prerequisite-patch-id: 4d0e116722d59825154c8e8917d0202fd98078f5
prerequisite-patch-id: be040da44396d9818f18db2853fe7c262d4cfb73
prerequisite-patch-id: 9dd59bf6e3327ce8bd845686febef2f5e193efb8
prerequisite-patch-id: dd8f2c037d15372f5e02c0accdf56fc532c3cfdb
prerequisite-patch-id: 34e6fad6310eb1ce10ccda70cd4124a39485b764
prerequisite-patch-id: dca8caad3fdaff54750576381a62011dfd2073bd
prerequisite-patch-id: d9ede47a8c34e495533296dd0aca07a93204abd6
prerequisite-patch-id: 1404bc1efe086917d7cd370a99952902bf9baa71
prerequisite-patch-id: 79de1cedfbad6c39a9304473650ac378741d18d0
prerequisite-patch-id: ed8b4ba87010952fcf09bbdbaa0df7e202f4086a
prerequisite-patch-id: f5238d8aff99b6f36ed9637a9aa6a3216aa84027
prerequisite-patch-id: 8bd4656b09c737c798a4d13de7631202e24cd95e
prerequisite-patch-id: 0fc2d74ba0d2671dd817adb8e55d3ecb187f4f7a
prerequisite-patch-id: 7e0459b2079578523aaf464e68be249b32813e90
prerequisite-patch-id: 4c388ea0b838edfc31bb4d114b8bb91169eee80d
prerequisite-patch-id: 98948ab791c0d0eb380910c7ac2946c0226397c1
prerequisite-patch-id: 70db189d6734c40c68fb3a4c1f09d62b26e81180
prerequisite-patch-id: 1323e461e6cebf72c76e974de69d79d22a072440
prerequisite-patch-id: 5fb7ae04b288183a278d3fae0aa6346170099bb0
prerequisite-patch-id: fa69b5303e36547b6559d6f5f50326e6ae9ba4e4
prerequisite-patch-id: 39927ac63686b25cda5164f5a0e41abee9d4784a
prerequisite-patch-id: 1688f27e8db25c08bfb18cbb2abb6a2372b4b633
prerequisite-patch-id: 1ddb34ef92e4bc7375994a4f160849bae927428d
prerequisite-patch-id: c7bcb86220aad6c6181cd08d0d78a1f65da78f71
prerequisite-patch-id: 0e1e0ea1ad9c162a9e738b0bddcb38f25f48c41b
prerequisite-patch-id: 67d880d2df5b91f33ad20cc12c444d5401103e5a
prerequisite-patch-id: 05d7499afbcce35d4c8240d2cf7dee4165e3bf1c
prerequisite-patch-id: f4d38661047e7142550201e28a6662fa232a3f88
prerequisite-patch-id: a7901d9c84089ad0ce46ff22f4b32d6e387a9752
prerequisite-patch-id: e5cbef4294e38c6d33f3f6ad447abc55ebe68db5
prerequisite-patch-id: 3032166b901850a364c9b0337b09523a3ebf596c
prerequisite-patch-id: 26ce057d5b5d135be5d981e891df308945e4ab18
prerequisite-patch-id: 80b3792ca27e649f9eb28cf79d9a072fe2bc2205
prerequisite-patch-id: 29ec107b61ae72c86e0a20a535858148ad54c7d5
prerequisite-patch-id: c077af919afa56ff5188a40ddad027bdf9be8e2b
prerequisite-patch-id: 3c190de51da5ed5ee7ac4230fb453f22ddff377f
prerequisite-patch-id: a09e1ef785b415ce5b867645ec8e89c8b87af58d
prerequisite-patch-id: 7d4b3c9568296547df5bc3ae316d150a55f8c544
prerequisite-patch-id: 5118a5853b19579d43ee96622289390176df489d
prerequisite-patch-id: b91fda362b852a25ca35fd8dc8a7fd66a1b0daf7
prerequisite-patch-id: 33e81269fba910f5ac31cfb05946993c0bac5868
prerequisite-patch-id: b392f1d558bb8db0bd6cccd59fd4957b13c4b96f
prerequisite-patch-id: 20139d47344c6ef19e65f78abda5de6ca76f8d0b
prerequisite-patch-id: b67da7c3d8d28ef8b4628679525c768da4f3c85c
prerequisite-patch-id: ead3d10df7d01e1297c247195dbfd09b3fb9b63a
prerequisite-patch-id: 762a4b1408d0a5ad7f46592d0a8b066a8a59a7e2
prerequisite-patch-id: 0c55ec8437aa6e66e86c48e1d4fa02dea528dfd8
prerequisite-patch-id: f0db73f74b0d0a1819437fdf24cae30dd6b48651
prerequisite-patch-id: 8c27b8a8ab296a6c6cd6a85b6357ae498ae28fba
prerequisite-patch-id: b2737cc5da129d18e0055aa061d54195ef13894d
prerequisite-patch-id: ff70d9ba9dce54b2fe340c4086d7e12c375263c0
prerequisite-patch-id: 49bf1d83a71a3849bc1121c3c0e6e716d2e4f155
prerequisite-patch-id: 37ec19fbb64bcaabc5bce195b4285300c16d7d0e
prerequisite-patch-id: 97dbd838a9f5510c65808f38fa39a4a24eaa2293
prerequisite-patch-id: 002824589ccc7b81b3a5ecdb03dcd9a9c05e8ceb
prerequisite-patch-id: 5fdfc8c739d18459431312ae2bb4fe69aad73d30
prerequisite-patch-id: f1f37a32fe8303c3cb8b8ea96297e594b75d664d
prerequisite-patch-id: 0fe222253bf21dba54cbd7a400a36777c96429e8
prerequisite-patch-id: b3283c31adc1bc06cd12b505e6641582a13b0ef6
prerequisite-patch-id: 1b6c5a39852547f7b2d64dbc856b887668f07e07
prerequisite-patch-id: 13fa7d2e670df9728d4b387e834c3d420ff9ee37
prerequisite-patch-id: ee541dfb77f8aab4b97641ecb48cdb4aaf9d077b
prerequisite-patch-id: 234e3c8c015b774c66848db45d2ad4cebea89f75
prerequisite-patch-id: 4c5ac8c2395c91c02239d0785ff95bcac67566f5
prerequisite-patch-id: 0caad3b04dd135a569dcf61ddcaf18c72047a9c8
prerequisite-patch-id: cd6efd3519c5cca6f82d7baf2c36903129093e3f
prerequisite-patch-id: 48005d9aaf97ebc40a1aac963a688015aaef2d3e
prerequisite-patch-id: d3d9cc4604876dcec4b7b5c2aa32e03aa388ad45
prerequisite-patch-id: 457ee4a9a3b16a200866013614b8cad50332cf1b
prerequisite-patch-id: 7c831bdbc62b3809ed22321244880e86740e6e4a
prerequisite-patch-id: be29ab3e3aa22295ae90754e9891573edfed0647
prerequisite-patch-id: 5e92f3de83af952de9c5e9aa04b4d5a5378193f5
prerequisite-patch-id: fb78e1072d328ae037c5d7f65de94557d85d4613
prerequisite-patch-id: 92386b453ce827699ab5a49f9598db2f5641dfb6
prerequisite-patch-id: 38b5e8a512797a4a74572926a8094d51bfa46a86
prerequisite-patch-id: d8166e5a71ae2de06c93fde6f2d57d6081f16d13
prerequisite-patch-id: aa629bb71bae08b3b6ab475c1dd1e8aca0565107
prerequisite-patch-id: 36daa4867943717e495975755ed57a63e16ad53b
prerequisite-patch-id: bb050ef272859d064f82bada98bab3ae03d34f64
prerequisite-patch-id: caec484b0aad68d915a9fe065a06da6d0bd57f44
prerequisite-patch-id: 5e8bc582504bcb1c4349f39742bd2cce1ec43745
prerequisite-patch-id: d54eaee27ed6bb9ce030507e2613bcdf00ca80a3
prerequisite-patch-id: 90918a2f25c22564071741a44c209d590a5dbca7
prerequisite-patch-id: d1b5d6a0f3fe5facad73d6171325b1f5ae6ec085
prerequisite-patch-id: e4f34f4c962a76626ee1afb10c83a99353c7ec1f
prerequisite-patch-id: a53bd42288f0737c2d62f2b411a9234161de4a14
prerequisite-patch-id: 6bac5fe78b223a4fa2adf74fc7b83205b39d0fda
prerequisite-patch-id: 777516cc1ab3bd1904b6ff841945990497326670
prerequisite-patch-id: 59fbea9aa38d471bc3902d155ad71e0943ebf7c8
prerequisite-patch-id: 0af1d5a728df87284243cdefe792b3196eaa83da
-- 
2.34.1


