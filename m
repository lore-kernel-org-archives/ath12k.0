Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC5ECC6B2C
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=; b=e2jxL3v/gIOcYeT3J4qv62uvIj
	eYrhsRjKu1UIb1Zgn6vRE6lXp1Lnh8TtCr1ViAmrGf+B8JN9vJbB9Ft1LbRyS80i9dsDBx0BcBpJI
	tFnn8N3vgL3E11eoMzZD13B3sK6LtdyyAYhqlq4CAX6QyDDRqlFC6kQhAsiP9aKgItS/+HEVoLv3Z
	a8HdSUnXPMGJ7Drt/Qat6l3qHdlznphQZpxbPztd5SpZWSSEEgWeFNCpo6PjayCEbPwtuB7YMAkE2
	o8VzHjKzhsEKfT7sPmuFfRgx3V1eBku6sTD0VI2A7yQdzPYiLwYSkrXB9jf4h+YTSmzJlJFiCMIbN
	7W4BeGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydi-0000000FWTT-0Oel;
	Wed, 14 Oct 2026 13:03:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydZ-0000000FWQh-0VZi
	for ath12k@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=; b=YWu06addsE4Xxbv3rxPgZbl2ja
	Km3NdZMovnY0Xgbbty5+jE/1hAMgLKfSGf2Jt0mvmzIQ9DROKgYqs1VHaZN3l8Bu7VO/mP2KntHqq
	Y/zwlbq7HAscZWJNwi2PaW2rymLPHUPkhCc15ORcWcLYNQCBPIKTvTdIhaACCOdwOrGSx/Lkawx+r
	X68cYZUontVXso93ZAtv/d3r6SFszC/1598lnKO2u8MbZR3sDQyGcgfAIhnqKSEoeUlk+xFt9hq7Z
	twqUnTKnlE2eFvMBSckp4HVO6tYG4hYYZOs5fU3Ra7AE6Cc3FIgmWiKF9rQT42JnuTG6vjK+i2W7Y
	H7/uC/5w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGydW-0000000GmpX-0cT4
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 13:03:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBpFqK2515934
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 13:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=; b=RvMXjsifKlNt1rII
	fO55X/g4p41W+W1KVzo87l1zL49WmC9d2lyhkP+VeqNWak5khUcmbcS/qlN/l8Ky
	9rXz4vydkRJpeueZ3Sg6ulC3slMgtQsPCOAnDw3fhpdvOwEWE0dEM8Jl7CdChTsb
	Q3AOSLmdngmrliLne8DPzQo7tQ9ZYLO4KXt+1mc5lgQ/qNlGdN2raFKf5fnz7kc6
	VO/N3idg2CaGXT4FRxoB9YjM490GVx39VKuNKW8UI5rnASxSBjxrCxvsPg9MLKmN
	lm7BiqXBvF3B6CcnOYYJWDOqtSXGculT6o3uixXE2B21MQJAQ+Hv/1VRy2Z7eOrG
	yqnPog==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709n11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 13:03:12 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e5a0ad2e81so4947681e0c.2
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982992; x=1792587792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=;
        b=ILrwfaipC1dXbRH1T/CatjWZAZOOHPllCkqidDipaisM90naDJ1MXCaQMyN5gj4l+k
         z5ew4oIpoARc435rDFfw80+QAjVvM/0+nis5KCpoRhIClmcYuQ51Pt4xUrz+hqaIhLN9
         KGJZyxDF96/WQ+UQSGDNOwHSYVGj+ppGwumXH++xm8BvPKnSUSvkQiCgbi9jqg3PJgC9
         KYY8MjGj25qnRuZvg4fd0L/dFeb80NzIvcxx9EF1BClf7DyQzmH6Mh2sjYpiTGBXA615
         g0jfV255n63ulhXOfqmhdliTJjen48E822n6F/iVKoYOyF9Z7GL0d1rQXt861MFE/B7D
         miMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982992; x=1792587792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=;
        b=ZXw+jxbb8p1NwPJSNhzTP5qydrKi2lhcl3EKssfTjNiHpgpBLYkkc9p90LFyoJATcx
         tHkmKjmgIu9QEVZY2ftnw7a++vzxjUaMegfoFg/GP6Enps9yh9zUUDKkozsCttHabnEA
         i+e1bjPo+6rh5RTSoye1EBk7OYd13KAqpkO7uTI3QY3hxJEfhvWTK+aJJX7szzZY5y0o
         qSkHHss3jrzgknzIHF2LJFQZL394qIh3WjrHINlTBvZFu5sYrR9fOy3HmJDoUgEVfse5
         RYz8bFs/+7wQDKAMYYIbxcXEyuHvvUFn3WuLxNp/rSHoCSRXwjgtMDSQoPjqV/cvA1kM
         zvIA==
X-Forwarded-Encrypted: i=1; AKwUvBzXhHDb64Tx0daAW22CIT1MywGnUaA8eC4cTMz2u8Fg8pBzfUCBhrzhsJ8aUboerFevTgUIdcU=@lists.infradead.org
X-Gm-Message-State: AFq9FYJy67MvYcLB4//Jv4YMVT5svpWikAYYT/uyXq8Ld3Gt5mZk9x2g
	BOJNIlhwPk9XJrx9ZAKap5HvjUBygeeznpA/AmAbXn18nUJjo3/1zqB3BQfI1scIsgWZ1qBNL/U
	2V4jNR8mpkNEA6LD8QhUhGrlMYKLXWAqetcbe0dbJOQl7ThRE6+BgXoiFWAVkiQNn
X-Gm-Gg: AYBFou2Hu8ZDHteyiTtmGyg+5O5h2sF1qgbmMSfTimlJ8aj7Eyl5mfIKvw/YdttEG6U
	7bze+OvajMzqC5Wxf4FtJixupqMzN1oY9DK8dtfO/GNsELyYbUflQAWWUf6KBA9WQyz4DtXiTLA
	290ebERmBF1tS1aqouZNA3WMOmM8mdGx/58PMYioEx1vQvrZ4I231J+O995+yNkM6iue55OqTrA
	Qy3D28Qs2Ncrgun/l8+I4minZCjtrGRwglbqNcZkJglR3SxDeAKhZSvdUnStQ8ePmekksGf3xLt
	odzZCDVjeZb5CfJW7ps4uzwKnUU5ycErRc63h2kPRgL2jyu9jFgzancYYzWyQLHmiKHwGzHpqUP
	dWJE/RiXeZw==
X-Received: by 2002:a05:6122:2194:b0:5e2:dce7:2d35 with SMTP id 71dfb90a1353d-5e91f44e9c6mr5335590e0c.9.1791982991213;
        Wed, 14 Oct 2026 06:03:11 -0700 (PDT)
X-Received: by 2002:a05:6122:2194:b0:5e2:dce7:2d35 with SMTP id 71dfb90a1353d-5e91f44e9c6mr5335558e0c.9.1791982990526;
        Wed, 14 Oct 2026 06:03:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:03:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:43 +0300
Subject: [PATCH RFC 5/5] arm64: dts: qcom: glymur-crd: Source MAC addresses
 from a UEFI variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E2C7ZTkYR9vN+vdiOw63P9ddewcVLDCC1y4LsZe6sNQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz319fp6TR+yR8jNw966xWlfX4ZKxxMxwQAtGC
 Y5X7z2YpXqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99fQAKCRAbX0TJAJUV
 VobVD/9FR+oK6sjkKteWETGAXlgN3C8denxNZe0WyouXGAVyEW12pOEEF8fr0C2OgAREtKa8eWx
 CZb4fsGAvK8yJg3KZOKUfK5uk5m3ZMHS3HPIWJbYxJngQ1lCafkynQLa4H4o4FJwKhgr+ekSXda
 JF1SVnurtaW6JZ/ykrvQlE/NoktVV5grv3NIB8oS7qY6+ZaKslQWvS4t2urpFaIm4g7vB6bFCSB
 TmqO49Bu1lO+3aeGr9yzXDd2h2XwyLZg8ONQxt44WLSyR4XOx4TiERP901FshmhB8bnbyb8sImX
 ZgtkhQX1BmRyWve2OxnpimwSGJ9s4jDpa0YrLttVmpZadBf2FjEVGxGOyTJh5WcIkqmnmuie2me
 SJYwOTtAlSMM9uzP7yyeUKy7r4w4DsWBAxfjLPnhW+D0IAO2Gbkl5u9JBNgV6hGaTqRZXj7eSbT
 PPFg6alEbLkyqaXPSZTdCdqt4NQAFDmaktq7G6XOgfC51m4bkoZWQGT58xvxtpY2KLFvcBU4j1L
 hTyjsZqvlcFaH60ghHVuTjnLfSfOttEqAuPKd6FwxWngzOuoQN8icHerDTx7m+4zWk6ycrbU8dG
 b73v7BApj+nminpuLcxv9fGjYYgjQsEGZ+yJaT0vE/xlwuyfdUWYilXyMp/42KgLvBLZKiJ5VxO
 tYlAxVFim181Kuw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX8o/y5QblTCOb
 qdb6pv4fN8o0G1XtwisbALaJ74YKQtE/vWt8yU3AkoVHvEQsIDhPiELFOTyYXElxCug0BkaCHhr
 kda7QXYaWIcD4F/fMnQ4549HXPj8cEqbddmBmaL0OqhPd1JQvp/VzBE2uu86Gr9XzZOp0gDE8bT
 a58WRdju4X3oWOBlU9YsPNqk8ZIilyu/wQbf5v6S84WW8yjukt4bDvm5niLBVugmvekXhvAizuJ
 LGdTfDo5OKEbIQOINjBAPptilm7eyk88ZIrbrh7q9TwQ0Qr06yllCNRv7G9TFWVvnCC9SEZ5mQy
 WN6BPDDkAPY3pDu/KnpJD/csKW/FNuMC8mruQouwPmq3C9/CMIlCB3W8ibWoom0zwAGUFO0s13i
 Q1vT6A+GEbm7AkusWV7Loxy8oaGxi/cuB4Duf/OkHGqIy1bBjU0EcEiHVqqZUNVtgtrCk/qxv11
 xlw32D6MKNWLXWPJ43g==
X-Proofpoint-GUID: 0qwuKekW_30zAtl5BVKY6n4iD4MC_Wn-
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf7d90 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SUfgz0WXR8OkDwgVpNIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 0qwuKekW_30zAtl5BVKY6n4iD4MC_Wn-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX49OIw4Zoj4KK
 bVNIsBwx/ObUdls8TFApEoEYxJPSPotFZy/Z7BTTfaP+TZ/dHTA3WlVslDzmiPh2ru0rubtWhZb
 M3a555b6c0U01wMEVklT9gw/c7b6pAg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_140314_456325_2CD13986 
X-CRM114-Status: GOOD (  13.58  )
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

Add an nvmem-efivar provider exposing the "MacAddresses" UEFI variable,
carrying the Bluetooth BD_ADDR (bytes 0-5) and the WLAN MAC address
(bytes 6-11), both MSB first. The variable is looked up by name, so no
vendor GUID needs to be hardcoded.

Wire the bd-address cell to the Bluetooth controller and the mac-address
cell to the WLAN endpoint (pci17cb,1107) via the standard nvmem-cells
binding. Until the variable is provisioned the cells read as zeroes and
the controllers keep using their default addresses.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..2dd09ab1d550 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -31,6 +31,22 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	/* BD_ADDR and WLAN MAC from the "MacAddresses" UEFI variable. */
+	efivar_macs: nvmem-efivar {
+		compatible = "nvmem-efivar";
+		efivar-name = "MacAddresses";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		bt_bdaddr: bd-address@0 {
+			reg = <0x0 0x6>;
+		};
+
+		net_mac: mac-address@6 {
+			reg = <0x6 0x6>;
+		};
+	};
+
 	clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
@@ -776,6 +792,9 @@ wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 
+		nvmem-cells = <&net_mac>;
+		nvmem-cell-names = "mac-address";
+
 		vddaon-supply = <&vreg_pmu_aon_0p59>;
 		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
 		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
@@ -1163,6 +1182,9 @@ bluetooth {
 		compatible = "qcom,wcn7850-bt";
 		max-speed = <3200000>;
 
+		nvmem-cells = <&bt_bdaddr>;
+		nvmem-cell-names = "bd-address";
+
 		vddaon-supply = <&vreg_pmu_aon_0p59>;
 		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
 		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;

-- 
2.54.0


