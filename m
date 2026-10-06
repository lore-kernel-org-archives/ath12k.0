Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222BACA5FF0
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 00:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yDjkbz5Ffu37NcoZjmNPGwdYZSoz7x9/XIZnhgKJqto=; b=OSkk8nNd7Us1BEpnP3ufCda1yT
	EvMLPS22GAglHDKIY1LxQrmhA3/mnqQW7ikH2KiNY0uRnNwnc8OSfIA6vPfu2vW23b3XX8HG2eC51
	hQuQ5ACZheN0xC+bifWhj6Bk2ByAbbejJSB4b5TKYPyPLV+FW3MkD3mUVa6I7uZhjO5XuyG+qOPEV
	MA6rwKPsWvujma9KKxazQxTqCJh7VNu/NwJQ4cedupU9DngQpsN64g7r+lvXjFhvBUBOj3Ao/KO60
	6ndiHgVCRbIBVvIFFbEqeq5YGenJwNjuWM8dq5GhY1I5pGRUcRjNrg22J5ZM4IETHfKQatrNi7PF5
	D8G2TSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtMU-0000000HQPy-3CZE;
	Tue, 06 Oct 2026 00:48:54 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtMR-0000000HQPZ-2aJd
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 00:48:52 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acb8b78d6cso3448619a12.2
        for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 17:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791247725; cv=none;
        d=google.com; s=arc-20260327;
        b=Bi6A+G3zIxrSAC+x4hLS0XO2ThcicDHFcxukQUg09M4uaMVDkMzBRayokEjsJA1Txz
         2IKCIixhzqZmNFreAHre18Z4EpuJooMxmnLUwHqbEvxJg8yFHAiqJgAMS7sKlk7NlKzN
         CTxEaEe5y72XKzPf/RtH0w16BsA+0eWBciS8vAEwsY9jz1f+5rKKBPQIaKQFr7pnJhpI
         SaYFOXr56uV37B+4qR1bltcVStddLCQZPJouofbwtMdGLe/H62o0HsFXFuOrc9tAmbEx
         Bnir+5baWpRIzAzpeAgroGWCBbEfU4CBFu+9KCo7V6rxMljFkLNMod9LbMpTgASHs1lN
         ObnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yDjkbz5Ffu37NcoZjmNPGwdYZSoz7x9/XIZnhgKJqto=;
        fh=unOd+iR/s4g3ccNRscfqoIvCvfbfQt24cpkffWnNbx8=;
        b=q/ev4zAzeDC9FFbfVPU63G/AlBa/WzBfcjg9xaVeWWlN65KIBFR8Aej+JLRxV9Bt4B
         cozLOO+f7z1Umt2Z7GdNLkmBkU9ud2AnVHPaW7f9dxOcoyTwD2DAimRATL+tZdlr+uG6
         8jSt2xbBsiWKLG1d++TcJZZVz56pW9jxEbbb7Anuruui+CiMpuuiTZQ2s1NUSeh7ay8M
         xPXbezlC2GgRzuL2yCYOCTFlAw4PXZzoojLTw4dXopbhKNxkSpvQ1CfggB8zb80ornPd
         mTZuKgdgMGhKmc80g3urFdDZPjZrs/C2z2hLbL6CrXwMetoxktByCZrya7ez7eSJOEmh
         MINg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791247725; x=1791852525; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDjkbz5Ffu37NcoZjmNPGwdYZSoz7x9/XIZnhgKJqto=;
        b=SfSgjhUqk70f5BMLkEIyB0B6AoE+zXrs90u2J/ESp54m8tMeui95RwUxMhcxEQbSoq
         e9FVX/W6KdGBZofOviIrXwOomzGheb4NNbHQqnkozMmuA5Oyig7MZjl4KD9pn+HjjwMn
         d5QjApt0l8ecRGQTumiCUwbbG4JwMgN101i9J+nqLZ5tAeaV88WH+Rl/kLdTKF8kW4R1
         3B9AnUObQtorfBSPl3CTcWZEzJYiKurkMByOo/Bl/IIWksgdMTwZotkvNc14xqYCtqgV
         aBC7t816YOzBpGimSZUOds6j7NXqJNdVAXEi6jemZCtd4VbMKryvBMySr6XsAN/kSt//
         OeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247725; x=1791852525;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yDjkbz5Ffu37NcoZjmNPGwdYZSoz7x9/XIZnhgKJqto=;
        b=Uiu07ZRgK8ht4ihX+xmQCtcKvpIjUCYZ/0PAWReShpxF1D+zHB2JJm2c8vyeEVMDZp
         DjTDsJxkWNR3ZiQeukAkGdzeyIdDg2YOsgpXaI1YYawN6sS26elnR+MCyswP7eLgOlnE
         Fs3ULk9tcvui4fYY8xXZkXAACG8Vt1msOHM121zvNRR39yyUJVKLF4qc5LO7SpPszuxe
         sbGcJpq26TRr9Fg/l+aDUmkSl0NUrCUa5wlDezGp2ihvwVEmK3bt3/0v+wmoOqz3bPJt
         cZJMa//1duJASEFvS08hkBUkgKF+0oqk0GItydulJg2OKIAvWQwAOzWL7mWGMJRwr5g6
         3oHA==
X-Gm-Message-State: AFq9FYJ1o7FZXuLOtfP57QMhzi9wGUsIfKlR5fybueg2JmTTN37pvUAc
	B+ZkJNTB63wcMZxeqJeak9rPxltkbb94AZVxPByXKsWo9RzP0HvAqImymk8n5vs6Vb2PcrlRpcT
	llZDwjYgbZuTkgyPxM0KPvafRR4thdwJn/g==
X-Gm-Gg: AYBFou2pjcHm2hvT26pgpWLacKdNNOSH2ERJVJFTtd4rkVc2jqh3WzHApyEPMIPjwdb
	3ZlhdDsADbpnfvf/tMsVrMQ7HpaWr77pwrSCvlx7ej6Vqx+5UivQUvCKjhJQHc86/EhgARba+uI
	zDj7k8IMwOricBI564jBJNqIe6NJ91gJAn2rD8wFgDGOYDP1qiqe4rxnEJFIwU2kbrWk7STkEDH
	Slb/FmoiornSTsBlTHkmSRLeaups2FHFMY8xOpfOLAe+2SOrgu5L2nx+smJB/AIR8hhtuoQ1oEs
	T+gr+EV0Kh3jvJoXK74TKfzAxKmrVnPqERoY7H4iObKnYLq9ffW2Kw==
X-Received: by 2002:a05:6402:52c1:b0:6ae:550e:59ee with SMTP id
 4fb4d7f45d1cf-6af9e30f5a0mr8429990a12.36.1791247725128; Mon, 05 Oct 2026
 17:48:45 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 5 Oct 2026 19:48:43 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 5 Oct 2026 19:48:43 -0500
MIME-Version: 1.0
From: John <dencity7@gmail.com>
Date: Mon, 5 Oct 2026 19:48:43 -0500
X-Gm-Features: AclHuK_Vy8K4gIsWI-19h33_M_T_ZH88YlsvURlXGiTBf8wG93VYcI5ALVd6YmU
Message-ID: <CA+KzPsr13czsH=k_UWJqj48C4Vsb-diQ-tiCh7W4XW31E8WzHg@mail.gmail.com>
Subject: [RFC PATCH] wifi: ath12k: service all RX rings in an interrupt group
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000005ca053065d215c6e"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_174851_854528_45DBA5F8 
X-CRM114-Status: UNSURE (   6.27  )
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

--0000000000005ca053065d215c6e
Content-Type: text/plain; charset="UTF-8"

An RX interrupt group may select multiple receive rings. The Wi-Fi 7
handler currently services only the highest set bit, even when the NAPI
budget has room for work from another selected ring. Walk all selected
bits and retain the shared budget and existing early-exit behavior.

On a locally adapted GL-BE3600/QCN6432, group 5 selects bits 2 and 3. A
host regression built from the actual RX block completes 3 of 6 queued
packets before the fix and 6 of 6 after it. Single-ring, empty-mask and
two-poll budget cases pass. Descending priority is unchanged; this does
not establish fairness under sustained traffic.

Signed-off-by: John <dencity7@gmail.com>

---
RFC validation and limits:

Source applicability and the host regression were checked against
backports 7.2 plus the 230 wireless patches from perceival/openwrt-flint3
commit 2365932733ca8ec3b346621d9cec2eb3df3b2cf3. The new patch applies
with zero fuzz. The same source-block regression and exact patch
application also pass against official ath.git main at
388d3c42e8aba1cfc3c6d2c52877a46d8cf740db (zero fuzz). No full module
build or hardware test was performed against either current revision.

Historical tests on Linux 6.18.39 with local backports 7.2-rc4/QCN6432
changes passed DHCP, DNS, 32 UDP flows and about 181 seconds of traffic
after reboot. These are bounded observations, not throughput or long-term
stability qualification. The contribution was developed with AI assistance.

--- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
@@ -52,8 +52,10 @@
 			goto done;
 	}

-	if (dp->hw_params->ring_mask->rx[grp_id]) {
-		i = fls(dp->hw_params->ring_mask->rx[grp_id]) - 1;
+	ring_mask = dp->hw_params->ring_mask->rx[grp_id];
+	while (ring_mask) {
+		i = fls(ring_mask) - 1;
+		ring_mask &= ~BIT(i);
 		work_done = ath12k_wifi7_dp_rx_process(dp, i, napi, budget);
 		budget -= work_done;
 		tot_work_done += work_done;

--0000000000005ca053065d215c6e
Content-Type: text/plain; charset="utf-8"; name="0001-ath12k-service-all-rx-rings.patch"
Content-Disposition: attachment; 
	filename="0001-ath12k-service-all-rx-rings.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: 4c74fd0121bf6498_0.1

RnJvbTogSm9obiA8ZGVuY2l0eTdAZ21haWwuY29tPg0KVG86IGF0aDEya0BsaXN0cy5pbmZyYWRl
YWQub3JnDQpDYzogbGludXgtd2lyZWxlc3NAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBbUkZD
IFBBVENIXSB3aWZpOiBhdGgxMms6IHNlcnZpY2UgYWxsIFJYIHJpbmdzIGluIGFuIGludGVycnVw
dCBncm91cA0KWC1VbnNlbnQ6IDENCk1JTUUtVmVyc2lvbjogMS4wDQpDb250ZW50LVR5cGU6IHRl
eHQvcGxhaW47IGNoYXJzZXQ9InV0Zi04Ig0KQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJp
dA0KDQpBbiBSWCBpbnRlcnJ1cHQgZ3JvdXAgbWF5IHNlbGVjdCBtdWx0aXBsZSByZWNlaXZlIHJp
bmdzLiBUaGUgV2ktRmkgNw0KaGFuZGxlciBjdXJyZW50bHkgc2VydmljZXMgb25seSB0aGUgaGln
aGVzdCBzZXQgYml0LCBldmVuIHdoZW4gdGhlIE5BUEkNCmJ1ZGdldCBoYXMgcm9vbSBmb3Igd29y
ayBmcm9tIGFub3RoZXIgc2VsZWN0ZWQgcmluZy4gV2FsayBhbGwgc2VsZWN0ZWQNCmJpdHMgYW5k
IHJldGFpbiB0aGUgc2hhcmVkIGJ1ZGdldCBhbmQgZXhpc3RpbmcgZWFybHktZXhpdCBiZWhhdmlv
ci4NCg0KT24gYSBsb2NhbGx5IGFkYXB0ZWQgR0wtQkUzNjAwL1FDTjY0MzIsIGdyb3VwIDUgc2Vs
ZWN0cyBiaXRzIDIgYW5kIDMuIEENCmhvc3QgcmVncmVzc2lvbiBidWlsdCBmcm9tIHRoZSBhY3R1
YWwgUlggYmxvY2sgY29tcGxldGVzIDMgb2YgNiBxdWV1ZWQNCnBhY2tldHMgYmVmb3JlIHRoZSBm
aXggYW5kIDYgb2YgNiBhZnRlciBpdC4gU2luZ2xlLXJpbmcsIGVtcHR5LW1hc2sgYW5kDQp0d28t
cG9sbCBidWRnZXQgY2FzZXMgcGFzcy4gRGVzY2VuZGluZyBwcmlvcml0eSBpcyB1bmNoYW5nZWQ7
IHRoaXMgZG9lcw0Kbm90IGVzdGFibGlzaCBmYWlybmVzcyB1bmRlciBzdXN0YWluZWQgdHJhZmZp
Yy4NCg0KU2lnbmVkLW9mZi1ieTogSm9obiA8ZGVuY2l0eTdAZ21haWwuY29tPg0KDQotLS0NClJG
QyB2YWxpZGF0aW9uIGFuZCBsaW1pdHM6DQoNClNvdXJjZSBhcHBsaWNhYmlsaXR5IGFuZCB0aGUg
aG9zdCByZWdyZXNzaW9uIHdlcmUgY2hlY2tlZCBhZ2FpbnN0DQpiYWNrcG9ydHMgNy4yIHBsdXMg
dGhlIDIzMCB3aXJlbGVzcyBwYXRjaGVzIGZyb20gcGVyY2VpdmFsL29wZW53cnQtZmxpbnQzDQpj
b21taXQgMjM2NTkzMjczM2NhOGVjM2IzNDY2MjFkOWNlYzJlYjNkZjNiMmNmMy4gVGhlIG5ldyBw
YXRjaCBhcHBsaWVzDQp3aXRoIHplcm8gZnV6ei4gVGhlIHNhbWUgc291cmNlLWJsb2NrIHJlZ3Jl
c3Npb24gYW5kIGV4YWN0IHBhdGNoDQphcHBsaWNhdGlvbiBhbHNvIHBhc3MgYWdhaW5zdCBvZmZp
Y2lhbCBhdGguZ2l0IG1haW4gYXQNCjM4OGQzYzQyZThhYmExY2ZjM2M2ZDJjNTI4NzdhNDZkOGNm
NzQwZGIgKHplcm8gZnV6eikuIE5vIGZ1bGwgbW9kdWxlDQpidWlsZCBvciBoYXJkd2FyZSB0ZXN0
IHdhcyBwZXJmb3JtZWQgYWdhaW5zdCBlaXRoZXIgY3VycmVudCByZXZpc2lvbi4NCg0KSGlzdG9y
aWNhbCB0ZXN0cyBvbiBMaW51eCA2LjE4LjM5IHdpdGggbG9jYWwgYmFja3BvcnRzIDcuMi1yYzQv
UUNONjQzMg0KY2hhbmdlcyBwYXNzZWQgREhDUCwgRE5TLCAzMiBVRFAgZmxvd3MgYW5kIGFib3V0
IDE4MSBzZWNvbmRzIG9mIHRyYWZmaWMNCmFmdGVyIHJlYm9vdC4gVGhlc2UgYXJlIGJvdW5kZWQg
b2JzZXJ2YXRpb25zLCBub3QgdGhyb3VnaHB1dCBvciBsb25nLXRlcm0NCnN0YWJpbGl0eSBxdWFs
aWZpY2F0aW9uLiBUaGUgY29udHJpYnV0aW9uIHdhcyBkZXZlbG9wZWQgd2l0aCBBSSBhc3Npc3Rh
bmNlLg0KDQotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL3dpZmk3L2RwLmMN
CisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvd2lmaTcvZHAuYw0KQEAgLTUy
LDggKzUyLDEwIEBADQogCQkJZ290byBkb25lOw0KIAl9DQogDQotCWlmIChkcC0+aHdfcGFyYW1z
LT5yaW5nX21hc2stPnJ4W2dycF9pZF0pIHsNCi0JCWkgPSBmbHMoZHAtPmh3X3BhcmFtcy0+cmlu
Z19tYXNrLT5yeFtncnBfaWRdKSAtIDE7DQorCXJpbmdfbWFzayA9IGRwLT5od19wYXJhbXMtPnJp
bmdfbWFzay0+cnhbZ3JwX2lkXTsNCisJd2hpbGUgKHJpbmdfbWFzaykgew0KKwkJaSA9IGZscyhy
aW5nX21hc2spIC0gMTsNCisJCXJpbmdfbWFzayAmPSB+QklUKGkpOw0KIAkJd29ya19kb25lID0g
YXRoMTJrX3dpZmk3X2RwX3J4X3Byb2Nlc3MoZHAsIGksIG5hcGksIGJ1ZGdldCk7DQogCQlidWRn
ZXQgLT0gd29ya19kb25lOw0KIAkJdG90X3dvcmtfZG9uZSArPSB3b3JrX2RvbmU7DQo=
--0000000000005ca053065d215c6e--

