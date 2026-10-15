Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016DBCC6B2F
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 05:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A75f2xxYnB8eKx443wh48OrbfwXotpjXVBQhOZKxNf4=; b=dY3Skfz9Hx7EWbMy+T0vPa82r+
	GtAQ4R8nryTEsBL8oiNg3u9o7H1aNrDwMug7YBKMmz6Jwx52MNU6ty24/USN4jRSX9LVzhwUcYiGj
	KQLkeh55xfLvdbU3V0NhSW6wTvACBueZM5M6JNFUSvwqmRHAQ98iNG53bLB7mzXVGfgu4GcLPNlCf
	HscMv4+c3zZlw/7NVpVAUxDufzFeN0NOsm+qOOl7OyBfMUQOltWdSjh5Fk+hsEW770WSSeFc0Tbn3
	bH8PLp28JJI3oQdtKo2dWfk8fp0DyQc79Gsu3gMk8K9/sIcqwjkMjxs+m+iSN+rKSSXmsbwP+m1xL
	zfD4wFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEQY-0000000Gtaa-30Ak;
	Thu, 15 Oct 2026 05:54:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEQU-0000000GtZv-3zGE
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 05:54:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wlCj1889647
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A75f2xxYnB8eKx443wh48OrbfwXotpjXVBQ
	hOZKxNf4=; b=ng3WBJg5hkRFKFMzsqBJ2dqpcCFDTbH8ihrbwUtD/5Le3+3N7Va
	ALJLUSb8XMsdx4huP0Zi+ATkI5n7OgE/kcZHspz6EPnLGMXO7yXgQ+uiKR+9siEx
	US7P/0ZSJmcT8Tfn9Ln+h7IUkGMqR12CxSCQ/9ZW7FhfLDtml/uLDK8ozgBYbL5a
	QuD+cwbeNAj96UaEclT29RuLBGEVSaIOl0sNitDU9bZA92hfkZJy0g0H1YSmZdEv
	jLihkPppBeCwTxEZICgVLfIG9rcjJqa+8WLK5GM4bgabspDFPY7T83S3CQj6zhVx
	9Cf2G7VkzqDG/vkFOe1bkhIyc+q6RZO95ZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda0c6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:54:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so1286057a91.2
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 22:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043689; x=1792648489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A75f2xxYnB8eKx443wh48OrbfwXotpjXVBQhOZKxNf4=;
        b=NNL6B3/8qZWA0t2W6fgTPZOWwHeu8MWWKWJM0Am4EsckgU2qBEn+11n9bogOLxNTnZ
         9RiKo4RkYmFwo14YCVeA4RNGMghjTJl4b/DBNwoEOrkzxWEk2bJ/jU1mBsZPpTnWHWo+
         0dD48aDI9QksXJcX9qAP9u42dZ8SPhT2nZfdMvTT2xlohVioI+/UBvtfQaUpnC4zCbq2
         EQamqX2V5vqERVY7kdYX97hY2ng6zPbBtphYpIB9+IcvjtgEr94OXEpW2ZCWdyraoHtz
         Bvp1W74ob8/rmVRv+EKx5UgJqFQeH/YJ2RL1e9EiqPuIYXOxaBCVIxSnbGPsp8EM4Bei
         unJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043689; x=1792648489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A75f2xxYnB8eKx443wh48OrbfwXotpjXVBQhOZKxNf4=;
        b=dwin5yvMEyh5YGnBpZF0/S31MfCKKK7291nKoXdDax9H86Nmv8LRfb59lp1PUs9x8M
         BkzqZ00MkrsB4+X2itAMGhZTnDMGQNQ4UwHDhW/Ik7DaGdSFnMCCJiHwyCEq+yzpdyBe
         GLEVxN1CETIfI8n/t3ktQ7jVSYa8Iy7q7ZIaiI9Bo9Wv2A3DVfPxuZnFFUv8uApeiPPF
         x8pOIiY0OISCNJteSzBu1hDnuh0NNS5k+QBJ4ZZU1k0l+FOdj/ZRjajXIHSB151kpZGU
         Ft/cdAsx1AYEgWfzTIZdfYUJXPOIgHLfAAXT7T0q6NxdHOcx2Ux8sksZodsnhJ6PaIcA
         IQ/g==
X-Forwarded-Encrypted: i=1; AKwUvBzdLG25sNdMbUbiGeBcSFbJatXO4RHtzX1j1E+JV1wknG5Wg6aAhiXbpc4BL0TXAtKm1T3M29g=@lists.infradead.org
X-Gm-Message-State: AFq9FYIL2BJQX5VolXA2yKq7rkzJg+20WszRkorg5SKXVfohYjxmWc0Z
	W8V84qt0njfKRUelh24YijMWyXYSs+3tltuZr/qWJEP2mAkOPRVMpaU218Od1iQ9M78qjeK9xkn
	lgAZlC52fe7HY2DA32z6lZsbrNkICCB3ox+F2wvMJtyOEX10km6dQtj1PvFeJIVX+
X-Gm-Gg: AYBFou3m5mw96TXJEjmxaZGg4+KnXJuVLjVYeocQtYurucMo1IwKHjhx8tVssGg9pBo
	e1ts6F0mI2DuH425cSQQVHoYRNcOFFjbMrfUHAywGUhMd4fktRXQ5hVVGJQ/iTdK8Xv3o3F96FJ
	mcrB4WCNf9bCFxFf6Uq/6Hf9GPV9j9ikMWThLBzzWSG3lq+DjReNuB8p3yqEMufQszyGYAGk6fe
	KFYnsks3YliHTA0pXOqCIs9tkkfhBDfevdzdpLgNmwT4TwXWxm7C+kiflsT/7yDrC2DXAhlUrDX
	tiQFbUENNOf1qIX7zdiJPL1Pv7bCZ9IABFzEMQFYxc21g6rcDZdPD0y05Kkz70kM7ToZr4BWvxS
	kWN7P1t7py1oM15zCTTdAID1ZXz9FHnGeqO+rRGRgwCXpr7KIXRHIzqjhbUTmHdq6iBqd1TAz9/
	7TUC8IxPKfged1
X-Received: by 2002:a17:90a:d006:b0:3aa:fc22:8aac with SMTP id 98e67ed59e1d1-3ab3a9325f8mr16227798a91.51.1792043688543;
        Wed, 14 Oct 2026 22:54:48 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3aa:fc22:8aac with SMTP id 98e67ed59e1d1-3ab3a9325f8mr16227773a91.51.1792043687992;
        Wed, 14 Oct 2026 22:54:47 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2629054a91.15.2026.10.14.22.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:54:47 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH RFC wireless-next 0/7] wifi: introduce generic QoS Management framework
Date: Thu, 15 Oct 2026 11:24:34 +0530
Message-Id: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXw477PhMSh35f
 yxdkW1hJKHM+5D/m7Ks4fPrDoPv4d3RBE9cOLhzjXQ9tLJgJbVO7yn4/h3EScQqu5JqCwl9+SeV
 jSKHz7pzj64tFvMSHfjILNbIM5YocWY=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad06aa9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=4TnTTFher7RBZE7yRwUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: DuCqO3E4drb0oGIO-CKjU0MVR6lBX2-G
X-Proofpoint-ORIG-GUID: DuCqO3E4drb0oGIO-CKjU0MVR6lBX2-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX9BiSq4Hjqco5
 xsXOXqim+yGB1GRI4vE/Ojl2GwrzecZBlNLwdWalVPSTDaEzHlirU3k+fglbsKL2z6GVKVWDc9t
 7DW2t3carogKat1brFxMMRzp68OIq+7/zeVAdoaS6wp5E5XMYM/5jhM5WIoU80cdLRzs0zpOKDV
 WwTxM0qzrDTW5Mn7TkS+0oE5miqzxjWMuT2KwPKmIAU9CdPITZQ+iJXUhq0EAucBJxrrbskPPTJ
 UmITUZ4ARNLkxMtJlKLgRdPwPdR0qbz7WGPf8Pvf+45fKqUwjLvP3ibniSHn3YgK7/BslowS8St
 iEoKoy/KWoKS5lEpuK9FwmP2hdRBnAxtS8tzVsZExZ0a/j9GGOyzackNkUQX7gqAK9P0rx0lTqr
 uGAZ3BOlzQmls2nnBNFtmWCTAoR0VfhA2jAInICfrGP4o6yB4yRBrzzvyPm4heHyxWZMkBiMjxm
 PW/AT+F9D2lUUv+PpkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_225451_983305_9EDBD1EC 
X-CRM114-Status: GOOD (  13.86  )
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

This series implements the generic QoS Management (QM) control-path
framework proposed in:

[DESIGN RFC] wifi: Robust AV streaming Design Proposal for AP [1]

The RFC discusses support for IEEE 802.11 Robust AV Streaming protocols,
specifically Stream Classification Service (SCS) and Mirrored Stream
Classification Service (MSCS), and proposes a generic userspace-to-driver
interface for exchanging QoS Management requests and responses.

The protocol procedures used by this series are specified in 11.25.2 and
11.25.3, IEEE Std 802.11-2024. The SCS Descriptor and MSCS Descriptor
elements are specified in 9.4.2.120 and 9.4.2.242, IEEE Std 802.11-2024,
respectively. The TCLAS element and TCLAS Processing element are specified
in 9.4.2.29 and 9.4.2.31, IEEE Std 802.11-2024. The QoS Characteristics
element is specified in 9.4.2.326, IEEE Std 802.11be-2024.

SCS and MSCS both follow a common request/response model where a non-AP STA
negotiates traffic classification and QoS treatment with the AP using QoS
Management action frames. While the descriptors used by the protocols
differ, both share request operations and per-descriptor status reporting.
SCS uses TCLAS elements and QoS characteristics, while MSCS uses a TCLAS
mask together with its user-priority fields.

Rather than introducing protocol-specific nl80211 commands and driver
interfaces, this series adds a generic QoS Management framework that can be
reused by current and future Robust AV Streaming protocols.

The framework provides:

  * IEEE 802.11 definitions for QoS Management protocols, request types and
    status codes.

  * A new NL80211_CMD_QOS_MGMT command and generic nested attributes
    capable of representing SCS and MSCS descriptors.

  * cfg80211 request and response structures together with a driver
    callback for QoS Management transactions.

  * Parsing, validation and response handling in nl80211. Responses are
    initialized with the request descriptor IDs and a declined status
    before the driver callback, so an unhandled descriptor cannot be
    reported as successful.

  * mac80211 forwarding support and RCU-protected per-station state
    tracking for successful QoS Management transactions.

  * map SCS-marked packets to negotiated TIDs and apply MSCS priority
    limiting during TX queue selection.

The MSCS packet mark retains the original uplink priority and applies the
priority limit only during transmit queue selection. This avoids
rechecking a previously limited priority against the original bitmap.

SCS descriptors carry either TCLAS elements alone (legacy SCS) or a QoS
Characteristics element (IEEE 802.11be SCS).  mac80211 handles legacy SCS
by mapping packets to the negotiated TID during transmit queue selection.
When a QoS Characteristics element is present, mac80211 forwards the full
descriptor to the driver via the qos_mgmt callback, allowing the driver to
apply hardware-specific scheduling or offload.

This series is complementary to Felix's proposal [2]. It deliberately keeps
protocol-specific flow classification out of mac80211.

For SCS, userspace and netfilter can classify flows and carry the resulting
metadata through conntrack and skb marks. For MSCS, mac80211 uses the
received user priority and the negotiated MSCS bitmap.

The corresponding packet-marking model is implemented by the QSDK hostapd
nftables integration [3][4]. It exposes a rule-management interface and
installs per-interface netdev egress chains that can match MAC, IP and
transport-layer fields and write packet marks. This is an implementation
reference for the userspace/netfilter integration; it is not currently
part of upstream hostapd. The netdev RFC describes the corresponding
packet-path support for using this metadata before transmit queue
selection [5].

This model avoids duplicating SCS TCLAS and flow-classification logic in
mac80211 while allowing userspace and netfilter to evolve
classification policies independently. It also keeps the mac80211
data path small and allows drivers to implement hardware-specific
handling or offload where appropriate.

For intra-BSS forwarding, the QoS Management mark may not be preserved
if the AP nftables configuration restores skb->mark from conntrack
unconditionally and the intra-BSS flow is not tracked.  Per-station peer
isolation routes STA-to-STA traffic through the full bridge path, ensuring
conntrack sees the flow and the QoS mark is intact at transmit queue
selection.

[1] https://lore.kernel.org/r/20250624205716.1052329-1-quic_rchoodam@quicinc.com/
[2] https://lore.kernel.org/linux-wireless/cover.3af9ba310d9145a9dfd653b5a886feaba98e8884.1788338716.git-series.nbd@nbd.name/
[3] https://git.codelinaro.org/clo/qsdk/oss/src/network/services/hostapd/-/blob/win.wlan_host_opensource.4.0.r39/src/ap/nft.h
[4] https://git.codelinaro.org/clo/qsdk/oss/src/network/services/hostapd/-/blob/win.wlan_host_opensource.4.0.r39/src/ap/nft.c
[5] https://lore.kernel.org/netfilter-devel/20261006085844.2694120-1-hari.chandrakanthan@oss.qualcomm.com/

Aishwarya R (7):
  wifi: nl80211: add QoS Management UAPI
  wifi: cfg80211: add QoS Management data structures
  wifi: nl80211: implement QoS Management request parsing and response
  wifi: mac80211: forward QoS Management configuration to drivers
  wifi: mac80211: track QoS Management station state
  wifi: mac80211: map SCS packets to configured TIDs
  wifi: mac80211: add MSCS packet classification

 include/linux/ieee80211.h    |   1 +
 include/net/cfg80211.h       | 220 +++++++++++
 include/net/mac80211.h       |   7 +
 include/uapi/linux/nl80211.h | 344 +++++++++++++++++
 net/mac80211/cfg.c           |  13 +
 net/mac80211/driver-ops.h    |  28 ++
 net/mac80211/ieee80211_i.h   |  18 +
 net/mac80211/mlme.c          | 165 ++++++++
 net/mac80211/rx.c            |  29 ++
 net/mac80211/sta_info.c      |   7 +
 net/mac80211/sta_info.h      |  21 +
 net/mac80211/trace.h         |  24 ++
 net/mac80211/wme.c           |  47 +++
 net/wireless/nl80211.c       | 730 +++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h      |  17 +
 net/wireless/trace.h         |  20 +
 16 files changed, 1691 insertions(+)

base-commit: a4190accbf7e05496754004bb701fb3e7d04e57f
-- 
2.34.1


